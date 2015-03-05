Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 631BE5299E
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 14:02:35 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25E2Yfi016678
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 08:02:34 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25E2XTq025022
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 08:02:33 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 08:02:33 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [RFC 3/4] qtbase: Choose QT platform abstraction
	based	on ARAGO_QT_PLATFORM.
Thread-Index: AQHQV0kKxbYFgMd7e02IOL1X5ytJ1J0N63rf
Date: Thu, 5 Mar 2015 14:02:32 +0000
Message-ID: <0F5C676F-2AB6-498D-8720-21A6728A501A@ti.com>
References: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>,
	<1425562410-19688-4-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425562410-19688-4-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC 3/4] qtbase: Choose QT platform abstraction based	on ARAGO_QT_PLATFORM.
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
X-List-Received-Date: Thu, 05 Mar 2015 14:02:35 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_0F5C676F2AB6498D872021A6728A501Aticom_"

--_000_0F5C676F2AB6498D872021A6728A501Aticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The eglfs script isn't needed and you should be able to remove
+export QT_QPA_PLATFORM=3DWayland
from qt_env.sh since by setting -qpa Qt already uses the correct one by def=
ault.



On Mar 5, 2015, at 7:34 AM, Stiffler, Jacob <j-stiffler@ti.com<mailto:j-sti=
ffler@ti.com>> wrote:

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com<mailto:j-stiffler@ti.com>>
---
.../recipes-qt/qt5/qtbase/qt_env_eglfs.sh          |    5 +++++
.../recipes-qt/qt5/qtbase_5.4.1.bbappend           |   10 ++++++----
2 files changed, 11 insertions(+), 4 deletions(-)
create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh b/meta=
-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh
new file mode 100644
index 0000000..4ae0d9f
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+### QT Environment Variables ###
+export QT_QPA_GENERIC_PLUGINS=3DAuto
+export QT_QPA_PLATFORM=3Deglfs
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b/meta-=
arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
index a466581..a86aba0 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend
@@ -5,16 +5,18 @@ GLES_EXTRA_DEPS_omap-a15 =3D "libdrm wayland"

PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl =
${GLES_EXTRA_DEPS}"

-PR_append =3D "-arago3"
+PR_append =3D "-arago4"

-QT_CONFIG_FLAGS +=3D "-qpa wayland"
+QT_CONFIG_FLAGS +=3D "-qpa ${ARAGO_QT_PLATOFM}"
Base on my other comments you would do a conditional statement to determine=
 which values to use.

-SRC_URI +=3D "file://qt_env.sh"
+QT_ENV_SCRIPT =3D "${@base_conditional('ARAGO_QT_PLATFORM', 'eglfs', 'qt_e=
nv_eglfs.sh', 'qt_env.sh', d)}"
+
+SRC_URI +=3D "file://${QT_ENV_SCRIPT}"

# Add custom Arago Qt 5 Environment script file
do_install_append () {
    install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
+    install -m 0644 ${WORKDIR}/${QT_ENV_SCRIPT} ${D}${sysconfdir}/profile.=
d/qt_env.sh
}

PACKAGES =3D+ "${PN}-conf"
--
1.7.9.5

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_0F5C676F2AB6498D872021A6728A501Aticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body dir=3D"auto">
<div>The eglfs script isn't needed and you should be able to remove</div>
<div>
<blockquote type=3D"cite"><font color=3D"#000000"><span style=3D"background=
-color: rgba(255, 255, 255, 0);">&#43;export QT_QPA_PLATFORM=3DWayland&nbsp=
;</span></font></blockquote>
from <span style=3D"background-color: rgba(255, 255, 255, 0);">qt_env.sh si=
nce by setting -qpa Qt already uses the correct one by default.</span><br>
<br>
<br>
</div>
<div><br>
On Mar 5, 2015, at 7:34 AM, Stiffler, Jacob &lt;<a href=3D"mailto:j-stiffle=
r@ti.com">j-stiffler@ti.com</a>&gt; wrote:<br>
<br>
</div>
<blockquote type=3D"cite">
<div><span>Signed-off-by: Jacob Stiffler &lt;<a href=3D"mailto:j-stiffler@t=
i.com">j-stiffler@ti.com</a>&gt;</span><br>
<span>---</span><br>
<span>.../recipes-qt/qt5/qtbase/qt_env_eglfs.sh &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;5 &#43;&#43;&#43;&#43;&#43;<=
/span><br>
<span>.../recipes-qt/qt5/qtbase_5.4.1.bbappend &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;10 &#43;&#43;&#43;&#43;&#43;&=
#43;----</span><br>
<span>2 files changed, 11 insertions(&#43;), 4 deletions(-)</span><br>
<span>create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_egl=
fs.sh</span><br>
<span></span><br>
<span>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh =
b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglfs.sh</span><br>
<span>new file mode 100644</span><br>
<span>index 0000000..4ae0d9f</span><br>
<span>--- /dev/null</span><br>
<span>&#43;&#43;&#43; b/meta-arago-distro/recipes-qt/qt5/qtbase/qt_env_eglf=
s.sh</span><br>
<span>@@ -0,0 &#43;1,5 @@</span><br>
<span>&#43;#!/bin/sh</span><br>
<span>&#43;</span><br>
<span>&#43;### QT Environment Variables ###</span><br>
<span>&#43;export QT_QPA_GENERIC_PLUGINS=3DAuto</span><br>
<span>&#43;export QT_QPA_PLATFORM=3Deglfs</span><br>
<span>diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend b=
/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend</span><br>
<span>index a466581..a86aba0 100644</span><br>
<span>--- a/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbappend</span><b=
r>
<span>&#43;&#43;&#43; b/meta-arago-distro/recipes-qt/qt5/qtbase_5.4.1.bbapp=
end</span><br>
<span>@@ -5,16 &#43;5,18 @@ GLES_EXTRA_DEPS_omap-a15 =3D &quot;libdrm wayla=
nd&quot;</span><br>
<span></span><br>
<span>PACKAGECONFIG[gles2] =3D &quot;-opengl es2 -eglfs,,virtual/libgles2 v=
irtual/egl ${GLES_EXTRA_DEPS}&quot;</span><br>
<span></span><br>
<span>-PR_append =3D &quot;-arago3&quot;</span><br>
<span>&#43;PR_append =3D &quot;-arago4&quot;</span><br>
<span></span><br>
<span>-QT_CONFIG_FLAGS &#43;=3D &quot;-qpa wayland&quot;</span><br>
<span>&#43;QT_CONFIG_FLAGS &#43;=3D &quot;-qpa ${ARAGO_QT_PLATOFM}&quot;</s=
pan><br>
</div>
</blockquote>
Base on my other comments you would do a conditional statement to determine=
 which values to use.<br>
<blockquote type=3D"cite">
<div><span></span><br>
<span>-SRC_URI &#43;=3D &quot;file://qt_env.sh&quot;</span><br>
<span>&#43;QT_ENV_SCRIPT =3D &quot;${@base_conditional('ARAGO_QT_PLATFORM',=
 'eglfs', 'qt_env_eglfs.sh', 'qt_env.sh', d)}&quot;</span><br>
<span>&#43;</span><br>
<span>&#43;SRC_URI &#43;=3D &quot;file://${QT_ENV_SCRIPT}&quot;</span><br>
<span></span><br>
<span># Add custom Arago Qt 5 Environment script file</span><br>
<span>do_install_append () {</span><br>
<span>&nbsp;&nbsp;&nbsp;&nbsp;install -d ${D}${sysconfdir}/profile.d</span>=
<br>
<span>- &nbsp;&nbsp;&nbsp;install -m 0644 ${WORKDIR}/qt_env.sh ${D}${syscon=
fdir}/profile.d/</span><br>
<span>&#43; &nbsp;&nbsp;&nbsp;install -m 0644 ${WORKDIR}/${QT_ENV_SCRIPT} $=
{D}${sysconfdir}/profile.d/qt_env.sh</span><br>
<span>}</span><br>
<span></span><br>
<span>PACKAGES =3D&#43; &quot;${PN}-conf&quot;</span><br>
<span>-- </span><br>
<span>1.7.9.5</span><br>
<span></span><br>
<span>_______________________________________________</span><br>
<span>meta-arago mailing list</span><br>
<span><a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-proj=
ect.org</a></span><br>
<span><a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-ara=
go">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a></span>=
<br>
</div>
</blockquote>
</body>
</html>

--_000_0F5C676F2AB6498D872021A6728A501Aticom_--
