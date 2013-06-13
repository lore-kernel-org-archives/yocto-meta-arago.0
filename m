Return-Path: <paul.kovitz@welchallyn.com>
Received: from na3sys009aog124.obsmtp.com (na3sys009aog124.obsmtp.com
	[74.125.149.151])
	by arago-project.org (Postfix) with ESMTPS id 13AC152A79
	for <meta-arago@arago-project.org>;
	Thu, 13 Jun 2013 18:36:52 +0000 (UTC)
Received: from mail-pd0-f170.google.com ([209.85.192.170]) (using TLSv1) by
	na3sys009aob124.postini.com ([74.125.148.12]) with SMTP
	ID DSNKUboRQyMrXYaQq1SqM5HFaVqCmfTVTaJJ@postini.com;
	Thu, 13 Jun 2013 11:36:52 PDT
Received: by mail-pd0-f170.google.com with SMTP id x11so5836100pdj.1
	for <meta-arago@arago-project.org>;
	Thu, 13 Jun 2013 11:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=h1ETXhLe/j/3Ak6EHJiIw9VRxbx9KxhVwAkofRZ6BmA=;
	b=V1uMXfLLsCOf4Y7W6ZXtkjxuyDQ8ohTVtMKYTTrPnAJ1ecwkDfW91ljvjtNpsTWQWe
	Bz3QOAWgzSG6qaBWp/OQIogxXBsDD0l+cZG9pLTU6l8tlpjQppQykzt8hyDkU32GjNTZ
	cyUAo3s3bshQrAuAITMEXa8N/fjZHqXyBylcbPWTVbu24zLAUuBFxRkOYvddoKR3wZye
	1UPYSEqAYuD7FFSLzTtsmAwck+Yar39JNIemJzP1bQaXhtju7jmPB1OdzZbIfyJHtsh6
	dQ6M3JNUZ92t9Q9b0qcSHySugg/Co5RT8xL9JWAj83JoYl/0OXzxj+lFb6ElqZgyHbx5
	c4Ow==
X-Received: by 10.68.251.234 with SMTP id zn10mr2014143pbc.188.1371148610403; 
	Thu, 13 Jun 2013 11:36:50 -0700 (PDT)
X-Received: by 10.68.251.234 with SMTP id zn10mr2014137pbc.188.1371148610291; 
	Thu, 13 Jun 2013 11:36:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.47.8 with HTTP; Thu, 13 Jun 2013 11:36:10 -0700 (PDT)
In-Reply-To: <20130613165457.GS3741@edge>
References: <20130613165457.GS3741@edge>
From: Paul Kovitz <paul.kovitz@welchallyn.com>
Date: Thu, 13 Jun 2013 11:36:10 -0700
Message-ID: <CA+edY+RB9HN0JsPJecU1MNO1-5biRUNFqiEW82_q+ztJDtXe7A@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
X-Gm-Message-State: ALoCoQmGXU9hQFIOMQJvNdkIjsB/kfF/q0WEbCB58JsfXOlYd0wE/3ikAyRbGf002orekeUrd9gCkAGcTCXdP0/VeDXZShcIsMlKYD2M9QhvA+sm+g7Ui0X2CQyOFI3TCAQ0avHKzJcq/Cf67kf2GDWyO7NMWS/OkSh8Cdkd1gN2gJjS7Aj0E+w=
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Updated Core TI-SDK setup and build instructions
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
X-List-Received-Date: Thu, 13 Jun 2013 18:36:52 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0969d9e03e04df0d69f8

--047d7b2e0969d9e03e04df0d69f8
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys.

Overall, the wiki looks clear. I have some questions.

The wiki does not address the SDK releases. I want to reproduce exactly
amsdk-05.07.00.00. Do I use the arago 2011.09 toolchain or the linaro
toolchain? Also, if I want to reproduce the amsdk-05.07.00.00 release when
some recipes always get the latest from a git repo or a svn repo, is there
a list of SRCREV overrides somewhere that I can put in my local.conf so I
can be sure I build with the version that was tested and released rather
than the latest version in the repo?

Thanks.


On Thu, Jun 13, 2013 at 9:54 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> All,
>
> Here are the updated instructions on how to setup your build environment
> for
> the Yocto Project and OpenEmbedded in order to build our Core TI-SDK images
> out of "meta-ti" TI BSP layer and "meta-arago" Arago Project distribution:
>
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
>
> Please let me know of any comments, questions or feedback. Thanks.
>
> --
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>

--047d7b2e0969d9e03e04df0d69f8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Denys.=A0<div><br></div><div>Overall, the wiki looks cl=
ear. I have some questions.</div><div><br></div><div>The wiki does not addr=
ess the SDK releases. I want to reproduce exactly amsdk-05.07.00.00. Do I u=
se the arago 2011.09 toolchain or the linaro toolchain? Also, if I want to =
reproduce the amsdk-05.07.00.00 release when some recipes always get the la=
test from a git repo or a svn repo, is there a list of SRCREV overrides som=
ewhere that I can put in my local.conf so I can be sure I build with the ve=
rsion that was tested and released rather than the latest version in the re=
po?</div>


<div><br></div><div>Thanks.</div><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">On Thu, Jun 13, 2013 at 9:54 AM, Denys Dmytriyenko <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@t=
i.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">All,<br>
<br>
Here are the updated instructions on how to setup your build environment fo=
r<br>
the Yocto Project and OpenEmbedded in order to build our Core TI-SDK images=
<br>
out of &quot;meta-ti&quot; TI BSP layer and &quot;meta-arago&quot; Arago Pr=
oject distribution:<br>
<br>
<a href=3D"http://arago-project.org/wiki/index.php/Setting_Up_Build_Environ=
ment" target=3D"_blank">http://arago-project.org/wiki/index.php/Setting_Up_=
Build_Environment</a><br>
<br>
Please let me know of any comments, questions or feedback. Thanks.<br>
<span><font color=3D"#888888"><br>
--<br>
Denys<br>
_______________________________________________<br>
meta-arago mailing list<br>
<a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank">meta-arag=
o@arago-project.org</a><br>
<a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago" ta=
rget=3D"_blank">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o</a><br>
</font></span></blockquote></div><br><br>
</div></div>

--047d7b2e0969d9e03e04df0d69f8--
