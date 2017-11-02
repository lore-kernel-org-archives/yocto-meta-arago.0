Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by arago-project.org (Postfix) with ESMTPS id 84EBB52A3C
	for <meta-arago@arago-project.org>;
	Thu,  2 Nov 2017 15:15:38 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id t71so5087112ywc.3
	for <meta-arago@arago-project.org>;
	Thu, 02 Nov 2017 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ExtKcMihet7yUlSIURyMBILWJ83RtuXTuW9A4s+HKKU=;
	b=p4Ejd3fCxpjit9DNhoDAZ/ThiR3fRezwfTDphwAcIDAoGOQYUSj2jjcy/OTEh5W8ET
	jJXAqC9m7GWvPUFB1nAp4Eil6Khg91gGr2GW3O2EOrj+k9mZ8fwjSckPNtI7nuQsoVv6
	moCHfHH7jmfrYwqmd/fIOrmtfocim4E1Hp8z/FihBRFyNofIwFBnpbrWUJXx7BZ4KUBG
	og50heV2Esk+iEU6PhAjno4Oatwrasz1C9QmSeru83epad+JmWRoQq20Jd4wmfKZNZ2u
	ZrjtJpw2prTXSPUEl7mKfq1IaW8rr9Vh7rkf/1jbYwvmsdhci6vg8r7UMbKgriWm0pne
	09/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ExtKcMihet7yUlSIURyMBILWJ83RtuXTuW9A4s+HKKU=;
	b=JMkAbf1lCyOY8J6Gv1f+/j9HuBhZKr0C4argEFwYqe46tirqc5GD0IyhenfT1nVEJl
	UHoE/YwAEKK+N3qvlGrSQaChn6V2RAwZl/15WMNOMQtNVLzo3LffBqI2AzrxC+7eB5e+
	RuKXSKnVf0QZGz4YNvzmlxiPtQ1cAUFj+RTUgP11/mgN2dvuPHVe+2HbEvDYrDF4+M3/
	BS/5SaqcsRWqVfMiSQ4yI1qGuQdx0y4twmK1ZTG4Kk4k1H1YqYHeR17yjHpg5q4NxHe2
	2n4/4JX40umR0seybufTmkRYvuVQobHMDG3fafJznogtxRyFXjyuZ/iaQI9W8ddWpo/7
	0vqw==
X-Gm-Message-State: AMCzsaX5B7uA7xn6EW9cLBzBtdu4tjB8mGlZL6o5wQqwb0BlpdfPCCJj
	Ki6ZVAjdbn5BR/yKm/2PrW9QtQshv9+Hk8tgHPs=
X-Google-Smtp-Source: ABhQp+Qba51QgahXzdwc+gZ4JJCvPJiKRXr4MhbnDROHSN+0oxkYgRhatD7KfnRXp3Jbrc4z2TRAAmnF9q1mC/cJMCI=
X-Received: by 10.13.252.66 with SMTP id m63mr2231658ywf.293.1509635738379;
	Thu, 02 Nov 2017 08:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL7qNnVC9ryX7bNt_JgYkrd11iJBZ_5Y3HRF+no4EwVBhQ@mail.gmail.com>
In-Reply-To: <CAFeBWL7qNnVC9ryX7bNt_JgYkrd11iJBZ_5Y3HRF+no4EwVBhQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Thu, 02 Nov 2017 15:15:27 +0000
Message-ID: <CAFeBWL4qYcEreMk48swwrkEuc9pOhfQZDetqp3QzbKd_T1gGYQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Nov 2017 15:15:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c06ac48ed2cd6055d017588"

--94eb2c06ac48ed2cd6055d017588
Content-Type: text/plain; charset="UTF-8"

Perhaps this is the crux of my original question:

build@6e35408e8fa5:~/tisdk/build$ bitbake mesa
NOTE: Started PRServer with DBfile:
/home/build/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46116,
PID: 16487
Parsing recipes: 100%
|########################################################################################################################|
Time: 0:00:18
Parsing of 2538 .bb files complete (0 cached, 2538 parsed). 3286 targets,
275 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:

/home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/device-tree-generation_%.bbappend
*ERROR: Nothing PROVIDES 'mesa'*
*ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to
ti-sgx-ddk-um, not mesa*
*ERROR: mesa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to
ti-sgx-ddk-um, not mesa*

Is it possible to separate mesa into separate components (libgles1,
libgles2 etc)?
I wrote mesa_%.bbappend with "PROVIDES_remove" for libgles1 and libgles2,
but seems to have no effect.


On Thu, Nov 2, 2017 at 9:49 AM Adam Lee <adam.yh.lee@gmail.com> wrote:

> Has anyone built Xwayland for Beagleboard X15 or AM57xx-EVM?
>
> There is no "official" support for X11 in the TI SDK. Only Wayland is
> present. I am hoping to run my X11 applications with Xwayland. I have
> included x11 and wayland in DISTRO_FEATURES, but weston-xwayland /
> xserver-xorg are refusing to build.
>
> OE/meta has core-image-weston [0] which should build Xwayland as well but
> it also fails at weston-xwayland / xserver-xorg.
>
> I notice there is an experimental branch [1] but it removes Wayland
> altogether and appears to be very experimental, so that is a no-go for me.
>
> [0]
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphics/images/core-image-weston.bb?h=master
> [1]
> http://arago-project.org/git/projects/?p=meta-processor-sdk.git;a=shortlog;h=refs/heads/morty-x11-experimental
>
>

--94eb2c06ac48ed2cd6055d017588
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Perhaps this is the crux of my original question:<div><br>=
</div><div><div>build@6e35408e8fa5:~/tisdk/build$ bitbake mesa</div><div>NO=
TE: Started PRServer with DBfile: /home/build/tisdk/build/cache/prserv.sqli=
te3, IP: 127.0.0.1, PORT: 46116, PID: 16487</div><div>Parsing recipes: 100%=
 |#########################################################################=
###############################################| Time: 0:00:18</div><div>Pa=
rsing of 2538 .bb files complete (0 cached, 2538 parsed). 3286 targets, 275=
 skipped, 0 masked, 0 errors.</div><div>WARNING: No recipes available for:<=
/div><div>=C2=A0 /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-=
tree/device-tree-generation_%.bbappend</div><div><b>ERROR: Nothing PROVIDES=
 &#39;mesa&#39;</b></div><div><b>ERROR: mesa was skipped: PREFERRED_PROVIDE=
R_virtual/libgles1 set to ti-sgx-ddk-um, not mesa</b></div><div><b>ERROR: m=
esa was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to ti-sgx-ddk-um, =
not mesa</b></div></div><div><br></div><div>Is it possible to separate mesa=
 into separate components (libgles1, libgles2 etc)?</div><div>I wrote mesa_=
%.bbappend with &quot;PROVIDES_remove&quot; for libgles1 and libgles2, but =
seems to have no effect.</div><div><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr">On Thu, Nov 2, 2017 at 9:49 AM Adam Lee &lt;<a href=
=3D"mailto:adam.yh.lee@gmail.com">adam.yh.lee@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Has anyone built Xwayl=
and for Beagleboard X15 or AM57xx-EVM?<div><br></div><div>There is no &quot=
;official&quot; support for X11 in the TI SDK. Only Wayland is present. I a=
m hoping to run my X11 applications with Xwayland. I have included x11 and =
wayland in DISTRO_FEATURES, but weston-xwayland / xserver-xorg are refusing=
 to build.=C2=A0</div><div><br></div><div>OE/meta has core-image-weston [0]=
 which should build Xwayland as well but it also fails at weston-xwayland /=
 xserver-xorg.=C2=A0</div><div><br></div><div>I notice there is an experime=
ntal branch [1] but it removes Wayland altogether and appears to be very ex=
perimental, so that is a no-go for me.</div><div><br></div><div>[0]=C2=A0<a=
 href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-g=
raphics/images/core-image-weston.bb?h=3Dmaster" target=3D"_blank">http://cg=
it.openembedded.org/openembedded-core/tree/meta/recipes-graphics/images/cor=
e-image-weston.bb?h=3Dmaster</a></div><div>[1]=C2=A0<a href=3D"http://arago=
-project.org/git/projects/?p=3Dmeta-processor-sdk.git;a=3Dshortlog;h=3Drefs=
/heads/morty-x11-experimental" target=3D"_blank">http://arago-project.org/g=
it/projects/?p=3Dmeta-processor-sdk.git;a=3Dshortlog;h=3Drefs/heads/morty-x=
11-experimental</a></div><div><br></div></div></blockquote></div>

--94eb2c06ac48ed2cd6055d017588--
