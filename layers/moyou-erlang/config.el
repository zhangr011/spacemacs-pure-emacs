(setq load-path (cons  "/Users/zhangrong/publish/otp_src_19.0/lib/tools/emacs/" load-path))
(setq erlang-root-dir "/Users/zhangrong/publish/otp_src_19.0/lib/erl_interface/")
;; add the home of the erlang binaries to the exec-path
(setq exec-path (cons "/usr/local/bin/" exec-path))
(setq erlang-compile-erlc
      (expand-file-name "/usr/local/bin/erlc"))
