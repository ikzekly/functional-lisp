;;;; Прочитать трехмерный массив из стандартного потока ввода.
;;;; Массив может содержать элементы различных типов –
;;;; целые, вещественные, комплексные числа, строки, символы, списки, другие массивы.
;;;; Необходимо найти сумму целых чисел,
;;;; не делящихся нацело на 5.
;;;; Если целых чисел в массиве нет, результат – 0.

;;;; Пример:
;;;; Дан трехмерный массив:
;;;; #3A(((1.8 5 #\B "may") ("the" 2.25 1.3 4) (17 0 "force" 55))
;;;;     (("be" #C(0 1) 5.02 99)
;;;;      ("with" 1.1 (#\Y #\N) 0.87)
;;;;      ("you!" #C(2.2 3.3) 42 4.2)))
;;;; Это массив размерности 2x3x4. В нем содержатся различные элементы,
;;;; в том числе следующие целые числа:
;;;; 5 4 17 0 55 99 42
;;;; Среди этих чисел есть те, которые не делятся нацело на 5:
;;;; 4 17 99 42
;;;; Их сумма равна 162, этот результат и нужно вывести
;;;; в стандартный поток вывода.

(defparameter arr (read))
(defvar dimensions (array-dimensions arr))

(defvar x (car dimensions))
(defvar y (car (cdr dimensions)))
(defvar z (car (cdr (cdr dimensions))))

(defvar result 0)

(loop for i from 0 to (- x 1) do (
    loop for j from 0 to (- y 1) do (
        loop for k from 0 to (- z 1) do
            (when (typep (aref arr i j k) 'fixnum)
                (if (/= (rem (aref arr i j k) 5) 0)
                    (setf result (+ result (aref arr i j k))
                    ))))))
result
