;; compile single file
(defun erlang-compile-module (&optional is_export_all)
  "compile current buffer"
  (interactive)
  (let* ((project-root (expand-file-name (project-current)))
         (lager-deps-ebin (concat project-root "deps/lager/ebin"))
         (dynarec-deps-ebin (concat project-root "deps/dynarec/ebin"))
         (include-dir (concat (concat "-I" project-root "include ")
                              (concat "-I" project-root "deps/ ")))
         (ebin-out-dir (concat "-o" project-root "ebin "))
         (export_all_flag (if is_export_all
                              " +export_all"
                            ""))
         (command-str
          (concat erlang-compile-erlc export_all_flag " -pa "
                  lager-deps-ebin
                  " +'{parse_transform, lager_transform}' +'{lager_print_records_flag, false}'"
                  " +debug_info +bin_opt_info "
                  include-dir ebin-out-dir " -Wall " buffer-file-name)))
    (message command-str)
    (save-buffer buffer-file-name)
    (message (shell-command-to-string command-str))))

(defun erlang-compile-module_ex_all ()
  (interactive)
  (erlang-compile-module "yes"))

(global-set-key [f5] 'erlang-compile-module)
