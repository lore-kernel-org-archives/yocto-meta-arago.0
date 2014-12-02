Return-Path: <sujith.h@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by arago-project.org (Postfix) with ESMTPS id EE1EB529D9
	for <meta-arago@arago-project.org>;
	Tue,  2 Dec 2014 14:55:04 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so9367332qcy.7
	for <meta-arago@arago-project.org>;
	Tue, 02 Dec 2014 06:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=I09cxRzNqai8VR3LXqbkZW+xeiCi0Yun134Nto3EOSs=;
	b=BZmvNPyctZEnopY0+a8FyruafAhV0LhrfTDJ4uAvMLb2XX0ENke7X9XbEA9y2pvmQ2
	b2Znj1ZVKADavIVzQF64qq/82BtQ2UEZvTbEY5JEgkd+bmD1QXNHgLlnIA5mWg8Q3eXc
	REX2waR3/e9bY7/a2UA+uDL27QWm1iT82QIEUzBMe2VmyE86o64zelHdLYJXhsnlyerI
	qO6YWVSKMeu2ihg+Tj4D7Xq5dgVcAMRedVubsp98UAvZd2SH9cTUeTNxZXYr2Jjbz9J9
	6qHgczp8F1CBDLCjVnMEKGohKAlZqf9IsA9IIAacjP/4lRECuHHK8Ei0ZxPTwNSF4p+2
	CN+w==
X-Received: by 10.224.65.69 with SMTP id h5mr96096154qai.69.1417532104267;
	Tue, 02 Dec 2014 06:55:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.18.114 with HTTP; Tue, 2 Dec 2014 06:54:44 -0800 (PST)
From: sujith h <sujith.h@gmail.com>
Date: Tue, 2 Dec 2014 20:24:44 +0530
Message-ID: <CADyYWLnXG+AeQL2OSdrjUQV9W4Q-s4qkBwa+tfRV8KWLhL-E=A@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: [meta-ti-amsdk] Query regarding libgles-omap3/5.01.01.01
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
X-List-Received-Date: Tue, 02 Dec 2014 14:55:05 -0000
Content-Type: multipart/alternative; boundary=001a11c2482e885e1d05093ce963

--001a11c2482e885e1d05093ce963
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am using the ligbles-omap3/5.01.01.01 for core-image-sato for the machine
Sitara XAM3359AZCZ100 Cortex A8 ARM processor. And I got Qt5 built for the
machine ( taken from meta-qt5). I am not able to run opengl examples of Qt5
and hence as a result the examples from qtdeclarative are also failing. The
error I get here is:

root@mel-am335x-boneblack:/usr/share/qt5/examples#
./opengl/hellowindow/hellowindow -platform xcb Qt Warning: Could not find a
location of the system's Compose files. Consider setting the QTCOMPOSE
environment variable. Qt Warning: Could not find a location of the system's
Compose files. Consider setting the QTCOMPOSE environment variable. Cant
find EGLConfig, returning null config Cant find EGLConfig, returning null
config EGL did not suggest a VisualID (EGL_NATIVE_VISUAL_ID was zero) for
EGLConfig 0 Unable to find an X11 visual which matches EGL config 0 Could
not initialize EGL Aborted root@mel-am335x-boneblack:/usr/share/qt5/example=
s#


May I know if the libgles-omap3 5.01.01.01 can be used with X11 or not? Or
any helpers what could be wrong here? If any more inputs are needed please
let me know.

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11c2482e885e1d05093ce963
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>I am using the ligbles-oma=
p3/<a href=3D"http://5.01.01.01">5.01.01.01</a> for core-image-sato for the=
 machine Sitara XAM3359AZCZ100 Cortex A8 ARM processor. And I got Qt5 built=
 for the machine ( taken from meta-qt5). I am not able to run opengl exampl=
es of Qt5 and hence as a result the examples from qtdeclarative are also fa=
iling. The error I get here is:<br><br>root@mel-am335x-boneblack:/usr/share=
/qt5/examples# ./opengl/hellowindow/hellowindow -platform xcb
Qt Warning: Could not find a location of the system&#39;s Compose files. Co=
nsider setting the QTCOMPOSE environment variable.
Qt Warning: Could not find a location of the system&#39;s Compose files. Co=
nsider setting the QTCOMPOSE environment variable.
Cant find EGLConfig, returning <span class=3D"">null</span> config
Cant find EGLConfig, returning <span class=3D"">null</span> config
EGL did not suggest a VisualID (EGL_NATIVE_VISUAL_ID was zero) <span class=
=3D"">for</span> EGLConfig 0
Unable to find an X11 visual which matches EGL config 0
Could not initialize EGL
Aborted
root@mel-am335x-boneblack:/usr/share/qt5/examples#
<br><br></div>May I know if the libgles-omap3 5.01.01.01 can be used with X=
11 or not? Or any helpers what could be wrong here? If any more inputs are =
needed please let me know.<br><br>Thanks,<br></div>Sujith H<br><div><div><d=
iv><div><br>-- <br><div class=3D"gmail_signature">=E0=B4=B8=E0=B5=81=E0=B4=
=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=
=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor t=
o KDE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" ta=
rget=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog=
&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujithh.info<=
/a><br></div>
</div></div></div></div></div>

--001a11c2482e885e1d05093ce963--
