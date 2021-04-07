;; Taken from:
;; https://lists.gnu.org/archive/html/emacs-orgmode/2010-08/msg00805.html
;;
;; Usage:
;; *** Good Friday
;; <%%(= -2 (calendar-days-from-easter))>
;;
;; *** Easter Sunday
;; <%%(= 0 (calendar-days-from-easter))>
;;
;; *** Easter Monday
;; <%%(= 1 (calendar-days-from-easter))>

(defun da-easter (year)
  "Calculate the date for Easter Sunday in YEAR. Returns the date in the
Gregorian calendar, ie (MM DD YY) format."
  (let* ((century (1+ (/ year 100)))
         (shifted-epact (% (+ 14 (* 11 (% year 19))
                              (- (/ (* 3 century) 4))
                              (/ (+ 5 (* 8 century)) 25)
                              (* 30 century))
                           30))
         (adjusted-epact (if (or (= shifted-epact 0)
                                 (and (= shifted-epact 1)
                                      (< 10 (% year 19))))
                             (1+ shifted-epact)
                           shifted-epact))
         (paschal-moon (- (calendar-absolute-from-gregorian
                           (list 4 19 year))
                          adjusted-epact)))
    (calendar-dayname-on-or-before 0 (+ paschal-moon 7))))

(defun da-easter-gregorian (year)
  (calendar-gregorian-from-absolute (da-easter year)))

(defun calendar-days-from-easter ()
  "When used in a diary sexp, this function will calculate how many days
are between the current date (DATE) and Easter Sunday."
  (- (calendar-absolute-from-gregorian date)
     (da-easter (calendar-extract-year date))))

;; -----
