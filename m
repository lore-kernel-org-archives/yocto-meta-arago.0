Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by arago-project.org (Postfix) with ESMTPS id 3D763529E5
	for <meta-arago@arago-project.org>;
	Fri,  3 Nov 2017 14:51:31 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id l32so2578031ywh.13
	for <meta-arago@arago-project.org>;
	Fri, 03 Nov 2017 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=GdmUjxdCVp95Q4A4GOgFm9k/91if0roOEx+ta50rYGI=;
	b=EcAEjcZbM4k9aOmhvnsvBrOssSRj1bXvBlA/5cJir5hx3b+lr19E1V2SnOw6wPpZw/
	93/ETSjzY5w55wCYveMOK2Jb+ymbvfF9ocri3rmWrr4KvkiKiMPVTWNAhirw80f8K0oF
	eAdxIW8xwq6mOj9nKc/CMjD4i5RnNrmrEGMKUmUk+FFiIsixO8QjgGprqg1JFg+qhZ7l
	w93JeA7XsPRgyGU8RZgHngOky6aJJC5Qhf2xBKVfhAvos6/lnXsxvPTh3iFVpN5eSQMJ
	UyQXhXsKzJMUfluTrp2EQltmz00TRLhb5uSsy8yylvIxLaYfZvvikYkbCswNHwH/WSsE
	/eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=GdmUjxdCVp95Q4A4GOgFm9k/91if0roOEx+ta50rYGI=;
	b=uB7kDnVP2Z9/0WTVqd3aVJj+uat8oF/b/YbxgvkccOQR+fL7etxHa82ZlOIqDO6s+6
	LdJXDQZYkt70zikJDoSHRm0djp4fHHO/bUiAZRtHKn7pZ52ovcj6/zNb16FcqezAsxn+
	IINQIX/fEEP5sLLteDPosS8w2aMauJ2mr7P/Gzk9+s21agpZbF5Y6/cy83odt43MWxXZ
	PQrQhGGi8CRu5h5V+f2XJAPzJQlJfr531ym2i1IuJKNZy7XTjgNSuUyeo0W2vXaKH3dM
	ztLwf453/70Un5G5I7ilNzkKt7kc59zARvDIKiJ8s1kDMvtE9umA2PIPFlJfkNjSH9rn
	/17g==
X-Gm-Message-State: AJaThX5BW2mJs85MVMfo7xICnQd4MB4SW+tmLeRKSYDR0X74OB4uTfHg
	8Kttky4raY57qN0sEG7tRXyaw4Mf0XZm610zVOk=
X-Google-Smtp-Source: ABhQp+TqjlJoff0gsWE3YK19tjXxqyg50Rxg6Z83mnRzopqdiq4tQFmdW7ZHXrgO/eCxmOwc55HJfn5pxNykVvatb/Y=
X-Received: by 10.37.105.139 with SMTP id e133mr1768719ybc.496.1509720691112; 
	Fri, 03 Nov 2017 07:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL7qNnVC9ryX7bNt_JgYkrd11iJBZ_5Y3HRF+no4EwVBhQ@mail.gmail.com>
	<CAFeBWL4qYcEreMk48swwrkEuc9pOhfQZDetqp3QzbKd_T1gGYQ@mail.gmail.com>
In-Reply-To: <CAFeBWL4qYcEreMk48swwrkEuc9pOhfQZDetqp3QzbKd_T1gGYQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Fri, 03 Nov 2017 14:51:20 +0000
Message-ID: <CAFeBWL74qVQmQ9oOqPvzLxnbBdx_Eb+esJPwHBg3NLtYyZd2RQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Re: Building Xwayland
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
X-List-Received-Date: Fri, 03 Nov 2017 14:51:31 -0000
Content-Type: multipart/alternative; boundary="94eb2c14ef488100f0055d153d71"

--94eb2c14ef488100f0055d153d71
Content-Type: text/plain; charset="UTF-8"

Ok with a bit of dance with mesa / mesa-gl, I got xclock to run on Xwayland.
Demo apps such as kmscube still runs fine. Weston comes up too.

I removed virtual/libgles1 virtual/libgles2 virtual/egl and virtual/libgl
from mesa's PROVIDES list. These components are provided by ti-sgx-ddk-um
already.
I likewise removed libgbm and libgbm-dev from mesa-gl. Package libgbm
provides these.


Adam

On Thu, Nov 2, 2017 at 11:15 AM Adam Lee <adam.yh.lee@gmail.com> wrote:

> Perhaps this is the crux of my original question:
>
> build@6e35408e8fa5:~/tisdk/build$ bitbake mesa
> NOTE: Started PRServer with DBfile:
> /home/build/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46116,
> PID: 16487
> Parsing recipes: 100%
> |########################################################################################################################|
> Time: 0:00:18
> Parsing of 2538 .bb files complete (0 cached, 2538 parsed). 3286 targets,
> 275 skipped, 0 masked, 0 errors.
> WARNING: No recipes available for:
>
> /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/device-tree-generation_%.bbappend
> *ERROR: Nothing PROVIDES 'mesa'*
> *ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to
> ti-sgx-ddk-um, not mesa*
> *ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to
> ti-sgx-ddk-um, not mesa*
>
> Is it possible to separate mesa into separate components (libgles1,
> libgles2 etc)?
> I wrote mesa_%.bbappend with "PROVIDES_remove" for libgles1 and libgles2,
> but seems to have no effect.
>
>
> On Thu, Nov 2, 2017 at 9:49 AM Adam Lee <adam.yh.lee@gmail.com> wrote:
>
>> Has anyone built Xwayland for Beagleboard X15 or AM57xx-EVM?
>>
>> There is no "official" support for X11 in the TI SDK. Only Wayland is
>> present. I am hoping to run my X11 applications with Xwayland. I have
>> included x11 and wayland in DISTRO_FEATURES, but weston-xwayland /
>> xserver-xorg are refusing to build.
>>
>> OE/meta has core-image-weston [0] which should build Xwayland as well but
>> it also fails at weston-xwayland / xserver-xorg.
>>
>> I notice there is an experimental branch [1] but it removes Wayland
>> altogether and appears to be very experimental, so that is a no-go for me.
>>
>> [0]
>> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/images/core-image-weston.bb?h=master
>> [1]
>> http://arago-project.org/git/projects/?p=meta-processor-sdk.git;a=shortlog;h=refs/heads/morty-x11-experimental
>>
>>

--94eb2c14ef488100f0055d153d71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok with a bit of dance with mesa / mesa-gl, I got xclock t=
o run on Xwayland.<div>Demo apps such as kmscube still runs fine. Weston co=
mes up too.<br><div><br></div></div><div>I removed virtual/libgles1 virtual=
/libgles2 virtual/egl and virtual/libgl from mesa&#39;s PROVIDES list. Thes=
e components are provided by ti-sgx-ddk-um already.</div><div>I likewise re=
moved libgbm and libgbm-dev from mesa-gl. Package libgbm provides these.</d=
iv><div><br></div><div><br></div><div>Adam</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr">On Thu, Nov 2, 2017 at 11:15 AM Adam Lee &lt;<a =
href=3D"mailto:adam.yh.lee@gmail.com">adam.yh.lee@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Perhaps this is th=
e crux of my original question:<div><br></div><div><div>build@6e35408e8fa5:=
~/tisdk/build$ bitbake mesa</div><div>NOTE: Started PRServer with DBfile: /=
home/build/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46116, PI=
D: 16487</div><div>Parsing recipes: 100% |#################################=
###########################################################################=
############| Time: 0:00:18</div><div>Parsing of 2538 .bb files complete (0=
 cached, 2538 parsed). 3286 targets, 275 skipped, 0 masked, 0 errors.</div>=
<div>WARNING: No recipes available for:</div><div>=C2=A0 /home/build/tisdk/=
sources/meta-openamp/recipes-bsp/device-tree/device-tree-generation_%.bbapp=
end</div><div><b>ERROR: Nothing PROVIDES &#39;mesa&#39;</b></div><div><b>ER=
ROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to ti-sgx-dd=
k-um, not mesa</b></div><div><b>ERROR: mesa was skipped: PREFERRED_PROVIDER=
_virtual/libgles1 set to ti-sgx-ddk-um, not mesa</b></div></div><div><br></=
div><div>Is it possible to separate mesa into separate components (libgles1=
, libgles2 etc)?</div><div>I wrote mesa_%.bbappend with &quot;PROVIDES_remo=
ve&quot; for libgles1 and libgles2, but seems to have no effect.</div><div>=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Nov=
 2, 2017 at 9:49 AM Adam Lee &lt;<a href=3D"mailto:adam.yh.lee@gmail.com" t=
arget=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr">Has anyone built Xwayland for Beagleboa=
rd X15 or AM57xx-EVM?<div><br></div><div>There is no &quot;official&quot; s=
upport for X11 in the TI SDK. Only Wayland is present. I am hoping to run m=
y X11 applications with Xwayland. I have included x11 and wayland in DISTRO=
_FEATURES, but weston-xwayland / xserver-xorg are refusing to build.=C2=A0<=
/div><div><br></div><div>OE/meta has core-image-weston [0] which should bui=
ld Xwayland as well but it also fails at weston-xwayland / xserver-xorg.=C2=
=A0</div><div><br></div><div>I notice there is an experimental branch [1] b=
ut it removes Wayland altogether and appears to be very experimental, so th=
at is a no-go for me.</div><div><br></div><div>[0]=C2=A0<a href=3D"http://c=
git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/images/co=
re-image-weston.bb?h=3Dmaster" target=3D"_blank">http://cgit.openembedded.o=
rg/openembedded-core/tree/meta/recipes-graphics/images/core-image-weston.bb=
?h=3Dmaster</a></div><div>[1]=C2=A0<a href=3D"http://arago-project.org/git/=
projects/?p=3Dmeta-processor-sdk.git;a=3Dshortlog;h=3Drefs/heads/morty-x11-=
experimental" target=3D"_blank">http://arago-project.org/git/projects/?p=3D=
meta-processor-sdk.git;a=3Dshortlog;h=3Drefs/heads/morty-x11-experimental</=
a></div><div><br></div></div></blockquote></div></blockquote></div>

--94eb2c14ef488100f0055d153d71--
