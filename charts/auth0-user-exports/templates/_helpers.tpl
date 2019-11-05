{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "auth-user-exports.app_name" -}}
{{- printf "%s-%s" "analytical-platform-auth0-user-exports" .Chart.AppVersion | replace "-" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
