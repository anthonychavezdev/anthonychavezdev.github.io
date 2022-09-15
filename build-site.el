;; Set up packages
(require 'package)
(setq package-user-dir (expand-file-name "./packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
;; Initialize package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

;; Customize the HTML output
(setq org-html-validation-link nil              ;; Don't show validation link
      org-html-head-include-scripts nil         ;; Use custom scripts
      org-html-head-include-default-style nil   ;; Use custom styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\""
      org-html-divs '((preamble "header" "")
                      (content "main" "")
                      (postamble "footer" "")))

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "personal-site"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
             :html-preamble
             "
              <nav>
                  <a href=\"/\">Home</a>
                  <a href=\"/Notes/\">Notes</a>
              </nav>
              <h1>%t</h1>
             "
             :html-postamble
             "
              Created with: %c
             "
             :html-doctype "html5"
             :html-html5-fancy t
             :with-title nil
             :with-author nil        ;; Don't include author name
             :with-creator t         ;; Include Emacs and Org vesion in footer
             :with-toc nil           ;; Don't include table of contents
             :section-numbers nil    ;; Don't include section numbers
             :time-stamp-file nil))) ;; Don't include time stamp of file publish

;; Generate the site output
(org-publish-all t)
(message "Build complete")
