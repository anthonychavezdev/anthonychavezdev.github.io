;; Load the publishing system
(require 'ox-publish)
;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "personal-site"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
             :with-author nil        ;; Don't include author name
             :with-creator t         ;; Include Emacs and Org vesion in footer
             :with-toc nil           ;; Don't include table of contents
             :section-numbers nil    ;; Don't include section numbers
             :time-stamp-file nil))) ;; Don't include time stamp of file publish

;; Generate the site output
(org-publish-all t)
(message "Build complete")
