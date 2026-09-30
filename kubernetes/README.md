# ET3 on local Kubernetes

Install shared ingress, PostgreSQL, Azurite and support services from the parent
as documented in its Kubernetes README. Then, from `systems/et3`:

```sh
../../bin/kubernetes up
../../bin/kubernetes status
../../bin/kubernetes logs
```

Open <https://et3.k8s.orb.local/>. The default context is `orbstack`; override
`--context`, `--docker-context`, `--domain` and `--https-port` as for ET1.
Use `up --build` to build this checkout rather than use a cached image.

This uses the existing `run.sh`, with `RAILS_ENV=production` and local
`DOCKER_STATE=create`: create `et3_production`, migrate schema/data, seed, then
start the existing Procfile web and Solid Queue processes together. Readiness
checks the response start page at `/`. The API URL is the internal Service URL;
Notify and SMTP use shared fake services and MailHog. HTTPS terminates at ingress.
No application source or production chart values are changed.

Admin connects to this database for its ET3 models, so ET3 database setup must
complete before admin's navigation can render. ET3's start page and subsequent
admin claim pages were verified; a full response submission has not been tested.
