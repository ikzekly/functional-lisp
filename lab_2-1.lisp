;;;; Прочитать беззнаковое целое число из стандартного потока ввода
;;;; и в каждом байте числа обменять местами старшую и младшую тетрады.
;;;; Результат вывести в стандартный поток вывода.
;;;; Примеры преобразования:
;;;; 345 (00000001 01011001) ==> 4245 (00010000 10010101)
;;;; 333444 (00000101 00010110 10000100) ==> 5267784 (01010000 01100001 01001000)

(defvar num 0)
(setf num (read))
(dotimes (i (ceiling (integer-length num) 8))
    (setf num
        (dpb
            (change-tetrad (ldb (byte 8 (* i 8)) num))
            (byte 8 (* i 8)) num)))
(print num)

;; 10110011
;; взял старшую тетраду 1011
;; взял младшую, сдвинул влево 0011000
;; сложил через OR => 00111011

(defun change-tetrad (b)
    (logior (ldb (byte 4 4) b)
        (ash (ldb (byte 4 0) b) 4)))
