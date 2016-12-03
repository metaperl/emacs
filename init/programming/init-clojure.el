(package-initialize)

(unless (package-installed-p 'clojure-mode)
  (package-refresh-contents)
  (package-install 'clojure-mode))

(unless (package-installed-p 'inf-clojure)
  (package-refresh-contents)
  (package-install 'inf-clojure))

(setq inf-clojure-program
      (concat
       "java -jar "
       (expand-file-name "~/install/clojure-1.8.0/clojure-1.8.0.jar")))

(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

(provide 'init-clojure)
