(in-package #:blogee)

(defapp hello-page
  :prefix "/")

(defwidget whello-page ()
  ((header
    :initform *global-header*)
   (styler
    :initform *global-styler*)
   (footer
    :initform *global-footer*)))

(defmethod render ((hello-page whello-page))
  (with-slots (header styler footer) hello-page
    (with-html
      (render styler)
      (render header)
      (:h1 "Psí dobroty CLOS-tičky, dělané s tajnou mimozemskou technologií.")
      (:div :class "center-box"
	    (:div :class "whello-page-text-block"
		  (:p "Naše firma, založená v roce 1999, vyrábí nejchutnější dobroty pro domácí mazlíčky na území České republiky.") (:br)
		  (:p "CLOS-tičky je rodinná firma sídlící v malebných Holubovicích, kde se věnuje s láskou a pečlivostí výrobě špičkových psích pamlsků. Od svého založení se zaměřují na poskytování vyvážené výživy a chutných pochoutek pro naše čtyřnohé přátele.")
		  (:p "Naše výrobky jsou pečlivě navrženy s ohledem na výživové potřeby psů a jsou vyrobeny pouze z nejkvalitnějších surovin. Spolupracujeme pouze s důvěryhodnými dodavateli, abychom zaručili bezpečnost a kvalitu našich produktů. Každá dávka je pečlivě kontrolována, aby splňovala nejpřísnější standardy.")
		  (:p "Naše škála produktů zahrnuje různé druhy pamlsků, od tradičních kostiček až po lahodné sušené maso. Věříme, že naše pamlsky nejenom potěší chuťové buňky vašich psů, ale také přispějí k jejich zdraví a celkovému blahu.")))
      (:h1 "Naši spokojení klienti :)")
      (render *bubble-clients*)
      (:h1 "Kde nás najdete.")
      (:div :class "center"
       (:p "Najdete nás v Holubovicích v Tursku, jak vidíte na následující mapě: ")
       (:br)
       (:raw "<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d40866.97273961296!2d14.214778442009667!3d50.19505792948112!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x470bc148e58586f1%3A0x400af0f66150ef0!2s252%2065%20Holubice-Tursko!5e0!3m2!1scs!2scz!4v1712492634425!5m2!1scs!2scz\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>"))
      (render footer))))

(defun make-hello-page ()
  (make-instance 'whello-page))

(defmethod reblocks/page:init-page ((app hello-page) url-path expire-at)
  (make-hello-page))
