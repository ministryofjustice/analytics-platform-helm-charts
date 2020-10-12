{{/*
Control Panel hostname
*/}}
{{- define "host" -}}
{{- printf "controlpanel.%s" .Values.servicesDomain -}}
{{- end -}}

{{/*
Old Control Panel API hostname
*/}}
{{- define "old_host" -}}
"cpanelapi{{- if .Values.branch -}}-{{ .Values.branch }}{{- end -}}.{{ .Values.servicesDomain }}"
{{- end -}}

{{/*
Old Control Panel Frontend hostname
*/}}
{{- define "old_cpfrontend_host" -}}
"cpanel{{- if .Values.branch -}}-{{ .Values.branch }}{{- end -}}.{{ .Values.servicesDomain }}"
{{- end -}}
