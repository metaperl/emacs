(require 'prodigy)

(setq debug-on-error t)
(setq debug-on-signal t)

(prodigy-define-service
  :name "cex.io BTC Withdrawal"
  :command "main.py"
  :args '("withdraw" "multibit")
  :path "~/Documents/Programming/cex.io"
  :cwd "~/Documents/Programming/cex.io"
;  :cwd "/Users/admin/Documents/Programming/cex.io"
)

(prodigy-define-service
  :name "BLGM rollup"
  :command "main.py"
  :args '("rollup")
  :path "~/Documents/Programming/blgm"
  :cwd "~/Documents/Programming/blgm"
)

(prodigy-define-service
  :name "multibit"
  :command "ssh"
  :args '("-X" "$VPS_SERVER"
          "cd exe/MultiBit-0.5.16; java -jar multibit-exe.jar")
  :cwd "~"
)


(provide 'init-prodigy)
