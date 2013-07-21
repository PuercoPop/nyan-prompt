;;; nyan-prompt.el --- Nyan Cat on the eshell prompt.

;;; Author: Javier "PuercoPop" Olaechea <pirata@gmail.com>
;;; URL: http://github.com/PuercoPop/nyan-prompt
;;; Version: 20130721
;;; Keywords: nyan, cat, lulz, eshell, rainbow

;;; Inspired by from Jacek "TeMPOraL" Zlydach nyan-mode, to make Porter happy.


;;; License:
;;; Copying is an act of love, please copy. ♡
;;; The xpm taken awesome nyan-mode

(defconst +nyan-prompt-dir+ (file-name-directory (or load-file-name buffer-file-name)))
(defconst +nyan-prompt-nyan-cat-image+ (create-image (concat +nyan-prompt-dir+ "img/nyan.xpm") 'xpm nil :ascent 'center))
(defconst +nyan-prompt-nyan-cat-string+ (propertize "[]*" 'display +nyan-prompt-nyan-cat-image+))

(eval-after-load 'eshell 
  (setq eshell-prompt-function (lambda nil
                                 (concat
                                  (abbreviate-file-name
                                   (eshell/pwd))
                                  (if (= (user-uid) 0)
                                      " # "
                                    (concat " " +nyan-prompt-nyan-cat-string+ " "))
                                  ))
        
        eshell-prompt-regexp (rx (and line-start (0+ (not (any "#" "[]*" "\n"))) " " (and " " (or "#" "[]*") " ")))))

(provide 'nyan-prompt)

;;; nyan-mode.el
