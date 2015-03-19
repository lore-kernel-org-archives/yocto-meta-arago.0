Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4A09E529BD
	for <meta-arago@arago-project.org>;
	Thu, 19 Mar 2015 21:46:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2JLkfcb000947
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 16:46:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2JLkebm002061
	for <meta-arago@arago-project.org>; Thu, 19 Mar 2015 16:46:40 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 19 Mar 2015 16:46:40 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] qtbase-examples: Add exit buttons when
	not using wayland.
Thread-Index: AQHQYnVtZnH351E5vkS2K5Mb7pWvHZ0kp8MA//+uxHA=
Date: Thu, 19 Mar 2015 21:46:40 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814110022@DFLE09.ent.ti.com>
References: <1426790965-23449-1-git-send-email-j-stiffler@ti.com>
	<20150319213408.GE11557@edge>
In-Reply-To: <20150319213408.GE11557@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] qtbase-examples: Add exit buttons when not using wayland.
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2015 21:46:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patches don't actually seem to create the png image...

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 19, 2015 5:34 PM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH] qtbase-examples: Add exit buttons when no=
t using wayland.

I'm cnfused - why are you patching/adding png image twice?


On Thu, Mar 19, 2015 at 02:49:25PM -0400, Jacob Stiffler wrote:
> * Only the examples which are exposed in matrix are patched.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  ...Add-exit-button-for-non-window-environmen.patch |   60 +++++++++++
>  ...es-Add-exit-button-for-non-window-environ.patch |  104 ++++++++++++++=
++++++
>  meta-arago-distro/recipes-qt/qt5/qtbase/quit.png   |  Bin 0 -> 645 bytes
>  .../recipes-qt/qt5/qtbase_5.4.1.bbappend           |   23 ++++-
>  4 files changed, 185 insertions(+), 2 deletions(-)  create mode=20
> 100644=20
> meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-butto
> n-for-non-window-environmen.patch  create mode 100644=20
> meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-bu
> tton-for-non-window-environ.patch  create mode 100755=20
> meta-arago-distro/recipes-qt/qt5/qtbase/quit.png
>=20
> diff --git=20
> a/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-but
> ton-for-non-window-environmen.patch=20
> b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit-but
> ton-for-non-window-environmen.patch
> new file mode 100644
> index 0000000..e123df5
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0001-calculator-Add-exit
> +++ -button-for-non-window-environmen.patch
> @@ -0,0 +1,60 @@
> +From b0cb70d35131643dce61fa5a8ce9f652dc63e963 Mon Sep 17 00:00:00=20
> +2001
> +From: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
> +Date: Thu, 19 Mar 2015 15:21:08 -0400
> +Subject: [PATCH 1/2] calculator: Add exit button for non-window environm=
ent.
> +
> +Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
> +---
> + examples/widgets/widgets/calculator/calculator.cpp |    9 ++++++++-
> + examples/widgets/widgets/calculator/calculator.h   |    1 +
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/examples/widgets/widgets/calculator/calculator.cpp=20
> +b/examples/widgets/widgets/calculator/calculator.cpp
> +index bb3836b..afe0bba 100644
> +--- a/examples/widgets/widgets/calculator/calculator.cpp
> ++++ b/examples/widgets/widgets/calculator/calculator.cpp
> +@@ -78,6 +78,7 @@ Calculator::Calculator(QWidget *parent)
> +     Button *backspaceButton =3D createButton(tr("Backspace"), SLOT(back=
spaceClicked()));
> +     Button *clearButton =3D createButton(tr("Clear"), SLOT(clear()));
> +     Button *clearAllButton =3D createButton(tr("Clear All"),=20
> +SLOT(clearAll()));
> ++    Button *quitButton =3D createButton(tr("Quit"),=20
> ++ SLOT(quitClicked()));
> +=20
> +     Button *clearMemoryButton =3D createButton(tr("MC"), SLOT(clearMemo=
ry()));
> +     Button *readMemoryButton =3D createButton(tr("MR"),=20
> +SLOT(readMemory())); @@ -100,7 +101,8 @@=20
> +Calculator::Calculator(QWidget *parent)  //! [5] //! [6]
> +     mainLayout->setSizeConstraint(QLayout::SetFixedSize);
> +     mainLayout->addWidget(display, 0, 0, 1, 6);
> +-    mainLayout->addWidget(backspaceButton, 1, 0, 1, 2);
> ++    mainLayout->addWidget(quitButton, 1, 0, 1, 1);
> ++    mainLayout->addWidget(backspaceButton, 1, 1, 1, 1);
> +     mainLayout->addWidget(clearButton, 1, 2, 1, 2);
> +     mainLayout->addWidget(clearAllButton, 1, 4, 1, 2);
> +=20
> +@@ -297,6 +299,11 @@ void Calculator::changeSignClicked()  }  //!=20
> +[24]
> +=20
> ++void Calculator::quitClicked()
> ++{
> ++    qApp->quit();
> ++}
> ++
> + //! [26]
> + void Calculator::backspaceClicked()
> + {
> +diff --git a/examples/widgets/widgets/calculator/calculator.h=20
> +b/examples/widgets/widgets/calculator/calculator.h
> +index 76cf048..5e5c52e 100644
> +--- a/examples/widgets/widgets/calculator/calculator.h
> ++++ b/examples/widgets/widgets/calculator/calculator.h
> +@@ -64,6 +64,7 @@ private slots:
> +     void equalClicked();
> +     void pointClicked();
> +     void changeSignClicked();
> ++    void quitClicked();
> +     void backspaceClicked();
> +     void clear();
> +     void clearAll();
> +--
> +1.7.9.5
> +
> diff --git=20
> a/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-
> button-for-non-window-environ.patch=20
> b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-exit-
> button-for-non-window-environ.patch
> new file mode 100644
> index 0000000..cb39450
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase/0002-animatedtiles-Add-e
> +++ xit-button-for-non-window-environ.patch
> @@ -0,0 +1,104 @@
> +From e36fc9af517fe69bd4beac89fd00929fe70938b5 Mon Sep 17 00:00:00=20
> +2001
> +From: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
> +Date: Thu, 19 Mar 2015 15:22:51 -0400
> +Subject: [PATCH 2/2] animatedtiles: Add exit button for non-window =20
> +environment.
> +
> +Signed-off-by: Jake Stiffler <jake@mcsdk-hpc-test.(none)>
> +---
> + .../animation/animatedtiles/animatedtiles.qrc      |    1 +
> + .../animation/animatedtiles/images/quit.png        |  Bin 0 -> 645 byte=
s
> + examples/widgets/animation/animatedtiles/main.cpp  |   13 ++++++++++++-
> + 3 files changed, 13 insertions(+), 1 deletion(-)  create mode 100755=20
> +examples/widgets/animation/animatedtiles/images/quit.png
> +
> +diff --git=20
> +a/examples/widgets/animation/animatedtiles/animatedtiles.qrc=20
> +b/examples/widgets/animation/animatedtiles/animatedtiles.qrc
> +index c43a979..3675345 100644
> +--- a/examples/widgets/animation/animatedtiles/animatedtiles.qrc
> ++++ b/examples/widgets/animation/animatedtiles/animatedtiles.qrc
> +@@ -6,6 +6,7 @@
> +     <file>images/figure8.png</file>
> +     <file>images/kinetic.png</file>
> +     <file>images/random.png</file>
> ++    <file>images/quit.png</file>
> +     <file>images/tile.png</file>
> + </qresource>
> + </RCC>
> +diff --git a/examples/widgets/animation/animatedtiles/images/quit.png=20
> +b/examples/widgets/animation/animatedtiles/images/quit.png
> +new file mode 100755
> +index=20
> +0000000000000000000000000000000000000000..b9eb270c97306679f991669992d
> +18a5f37e4ce22
> +GIT binary patch
> +literal 645
> +zcmeAS@N?(olHy`uVBq!ia0vp^DIm<j0wiy}j=3Dc}0SkfJR9T^xl_H+M9WCijSl0AZa
> +z85pY67#JE_7#My5g&JNkFq9fFFuY1&V6d9Oz#v{QXIG#NP=3DYDR+ueoXe|!I#{XiaP
> +zfk$L90|Vb-5N14{zXE6%W4EV^V@SoVx3i+xF)Q*ox4)}DU&4IYN6u`^wDaMiFVzZ<
> +zwk8zC9+OD!F$57Jk4qT6)7BlEGa;p*qbFgTzu^y`Ke6F%9X%7uHWfW_Shq`H+LYZZ
> +z9xUDJ>}8qc&k=3DR1*5uW?(0<3RdAd#NOC>GincTgsvz9XK5pg&YRkcRMW6R=3D`6DPjn
> +zW(sC_!*02IQ=3D|8m?YF;hHU3*Z_qN%=3D>iGW}t3_GvA38thWQ()tW%Z|Ai@&h_mbMGp
> +z-nP5?IM))>xgNp~_j)`sWq93YBkr~L?1J36r5o>fOCFqmDyFXSrlebR2$zZZal;-D
> +z#`Ltv`T0Q)Dl6sQO%`zqTPC@8lGDkXrZ4K)^w+lWc*W)K_m%u`CoeF_=3D-;|bk<7=3Dg
> +zdSOc8v4Wo+kMIc@zHreA78H(t66yG4q5G4UzE2E8o>WGqBsiqBIH#;|OF7e7bNqE`
> +zhjdAeWOUV9S)*$+PaK{p<DbK_uaWEF%(Y8Tgeu;d_-W%09t{oK)qDv>d`D`T|4BdS
> +z`z8$yS<92+A6>FNSfU-gfN`Z-;u=3Dwsl30>zm0Xkxq!^403{7<njCBnyLktbA49%>J
> +pjI|96tqctMnb}UEXvob^$xN%nt>ItXzA~T&22WQ%mvv4FO#o;X_JaTb
> +
> +literal 0
> +HcmV?d00001
> +
> +diff --git a/examples/widgets/animation/animatedtiles/main.cpp=20
> +b/examples/widgets/animation/animatedtiles/main.cpp
> +index 09e9790..d8491d7 100644
> +--- a/examples/widgets/animation/animatedtiles/main.cpp
> ++++ b/examples/widgets/animation/animatedtiles/main.cpp
> +@@ -97,6 +97,12 @@ public:
> +         painter->drawPixmap(-_pix.width()/2, -_pix.height()/2, _pix);
> +     }
> +=20
> ++public slots:
> ++    void quitClicked()
> ++    {
> ++        qApp->quit();
> ++    }
> ++
> + signals:
> +     void pressed();
> +=20
> +@@ -121,6 +127,7 @@ class View : public QGraphicsView
> + public:
> +     View(QGraphicsScene *scene) : QGraphicsView(scene) { }
> +=20
> ++
> + protected:
> +     void resizeEvent(QResizeEvent *event) Q_DECL_OVERRIDE
> +     {
> +@@ -156,16 +163,18 @@ int main(int argc, char **argv)
> +     Button *randomButton =3D new Button(QPixmap(":/images/random.png"),=
 buttonParent);
> +     Button *tiledButton =3D new Button(QPixmap(":/images/tile.png"), bu=
ttonParent);
> +     Button *centeredButton =3D new=20
> +Button(QPixmap(":/images/centered.png"), buttonParent);
> ++    Button *quitButton =3D new Button(QPixmap(":/images/quit.png"),=20
> ++ buttonParent);
> +=20
> +     ellipseButton->setPos(-100, -100);
> +     figure8Button->setPos(100, -100);
> +     randomButton->setPos(0, 0);
> +     tiledButton->setPos(-100, 100);
> +     centeredButton->setPos(100, 100);
> ++    quitButton->setPos(100, -600);
> +=20
> +     scene.addItem(buttonParent);
> +     buttonParent->setTransform(QTransform::fromScale(0.75, 0.75), true)=
;
> +-    buttonParent->setPos(200, 200);
> ++    buttonParent->setPos(400, 200);
> +     buttonParent->setZValue(65);
> +=20
> +     // States
> +@@ -239,6 +248,8 @@ int main(int argc, char **argv)
> +     trans =3D rootState->addTransition(centeredButton, SIGNAL(pressed()=
), centeredState);
> +     trans->addAnimation(group);
> +=20
> ++    QObject::connect(quitButton, SIGNAL(pressed()), quitButton,=20
> ++ SLOT(quitClicked()));
> ++
> +     QTimer timer;
> +     timer.start(125);
> +     timer.setSingleShot(true);
> +--
> +1.7.9.5
> +
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/quit.png=20
> b/meta-arago-distro/recipes-qt/qt5/qtbase/quit.png
> new file mode 100755
> index=20
> 0000000000000000000000000000000000000000..b9eb270c97306679f991669992d1
> 8a5f37e4ce22
> GIT binary patch
> literal 645
> zcmeAS@N?(olHy`uVBq!ia0vp^DIm<j0wiy}j=3Dc}0SkfJR9T^xl_H+M9WCijSl0AZa
> z85pY67#JE_7#My5g&JNkFq9fFFuY1&V6d9Oz#v{QXIG#NP=3DYDR+ueoXe|!I#{XiaP
> zfk$L90|Vb-5N14{zXE6%W4EV^V@SoVx3i+xF)Q*ox4)}DU&4IYN6u`^wDaMiFVzZ<
> zwk8zC9+OD!F$57Jk4qT6)7BlEGa;p*qbFgTzu^y`Ke6F%9X%7uHWfW_Shq`H+LYZZ
> z9xUDJ>}8qc&k=3DR1*5uW?(0<3RdAd#NOC>GincTgsvz9XK5pg&YRkcRMW6R=3D`6DPjn
> zW(sC_!*02IQ=3D|8m?YF;hHU3*Z_qN%=3D>iGW}t3_GvA38thWQ()tW%Z|Ai@&h_mbMGp
> z-nP5?IM))>xgNp~_j)`sWq93YBkr~L?1J36r5o>fOCFqmDyFXSrlebR2$zZZal;-D
> z#`Ltv`T0Q)Dl6sQO%`zqTPC@8lGDkXrZ4K)^w+lWc*W)K_m%u`CoeF_=3D-;|bk<7=3Dg
> zdSOc8v4Wo+kMIc@zHreA78H(t66yG4q5G4UzE2E8o>WGqBsiqBIH#;|OF7e7bNqE`
> zhjdAeWOUV9S)*$+PaK{p<DbK_uaWEF%(Y8Tgeu;d_-W%09t{oK)qDv>d`D`T|4BdS
> z`z8$yS<92+A6>FNSfU-gfN`Z-;u=3Dwsl30>zm0Xkxq!^403{7<njCBnyLktbA49%>J
> pjI|96tqctMnb}UEXvob^$xN%nt>ItXzA~T&22WQ%mvv4FO#o;X_JaTb
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend=20
> b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> index 4af0582..210d23f 100644
> --- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
> @@ -5,11 +5,30 @@ GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"
> =20
>  PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/e=
gl ${GLES_EXTRA_DEPS}"
> =20
> -PR_append =3D "-arago4"
> +PR_append =3D "-arago5"
> =20
>  QT_CONFIG_FLAGS +=3D "-qpa ${@base_contains('DISTRO_FEATURES', 'wayland'=
, 'wayland', 'eglfs', d)}"
> =20
> -SRC_URI +=3D "file://qt_env.sh"
> +QT_EGLFS_PATCHES =3D "\
> +    file://0001-calculator-Add-exit-button-for-non-window-environmen.pat=
ch \
> +    file://0002-animatedtiles-Add-exit-button-for-non-window-environ.pat=
ch \
> +    file://quit.png \
> +"
> +
> +SRC_URI +=3D "\
> +    file://qt_env.sh \
> +    ${@base_contains('DISTRO_FEATURES', 'wayland', '',=20
> +"${QT_EGLFS_PATCHES}", d)}\ "
> +
> +python do_patch_append() {
> +    import shutil
> +
> +    work_dir =3D d.getVar("WORKDIR", True)
> +    s =3D d.getVar("S", True)
> +
> +    if not oe.utils.contains('DISTRO_FEATURES','wayland',True,False,d):
> +       =20
> +shutil.copy(os.path.join(work_dir,"quit.png"),os.path.join(s,"example
> +s/widgets/animation/animatedtiles/images/"))
> +}
> =20
>  # Add custom Arago Qt 5 Environment script file  do_install_append ()=20
> {
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

