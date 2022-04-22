// Manages session timeout & displays prompt prior to session expiry
const SECOND = 1000;
const MINUTE = 60 * SECOND;
const settings = {
    graceTimeout: 5 * MINUTE,
    sessionTimeout: 60 * MINUTE
}

const SessionPrompt = {

    graceTimerRef: null,
    sessionTimerRef: null,

    init: function (options) {
        console.log("SessionPrompt.init() called")
        const mySettings = {...settings, ...options};
        this.counter = settings.graceTimeout;
        this.updateTimeLeftOnPrompt(this.counter);
        this.setPromptExtendSessionClickEvent();
        this.startSessionTimer();
    },
    disable: function () {
        console.log("SessionPrompt.disable() called")
        if(this.sessionTimerRef) { clearTimeout(this.sessionTimerRef) }
        if(this.graceTimerRef) { clearInterval(this.graceTimerRef) }
    },
    startSessionTimer: function () {
        this.sessionTimerRef = setTimeout(()=> {
            this.timeoutPrompt.apply(this)
        }, settings.sessionTimeout - settings.graceTimeout);
    },

    setPromptExtendSessionClickEvent: function () {
        document.querySelector("#session_prompt_continue_btn").onclick = ()=> { this.refreshSession.apply(this, arguments) };
    },

    timeoutPrompt: function () {
        console.log(`SessionPrompt.timeoutPrompt called after ${settings.sessionTimeout - settings.graceTimeout}`)
        this.graceTimerRef = setInterval(()=> { this.promptUpdate.apply(this) }, SECOND);
        this.togglePromptVisibility();
    },

    promptUpdate: function () {
        if (this.counter === 0) {
            console.log("SessionPrompt.promptUpdate has now expired the session")
            this.expireSession();
        } else {
            this.counter -= SECOND;
            console.log(`SessionPrompt.promptUpdate - ${this.counter / SECOND} seconds left`)
            this.updateTimeLeftOnPrompt(this.counter);
        }
    },

    togglePromptVisibility: function () {
        const node = document.querySelector("#session_prompt");
        if(node.style.display == 'block') {
            node.style.display = 'none';

        } else {
            node.style.display = 'block';
        }
    },

    updateTimeLeftOnPrompt: function (timeInMillis) {
        const seconds = timeInMillis / SECOND;
        const mins = Math.floor(seconds / 60);
        const secs = seconds % 60;
        const time = (mins === 0) ? secs : (mins + ":" + this.padSeconds(secs));
        document.querySelector('#session_prompt_time_left').innerHTML = time;
    },

    padSeconds: function (secs) {
        return ((secs + "").length === 1) ? "0" + secs : secs;
    },

    expireSession: function () {
        location.href = location.protocol + "//" + location.host + "/respond/session/expired";
    },

    refreshSession: function () {
        clearInterval(this.graceTimerRef);
        const that = this;
        fetch("/respond/session/touch", { credentials: 'include' }).then((response)=>{
            if(!response.ok) { return }

            that.togglePromptVisibility.apply(that);
            that.init.apply(that);
        });
    }
};

export default SessionPrompt;
