Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by arago-project.org (Postfix) with ESMTPS id 509555209B
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 10:41:32 +0000 (UTC)
Received: by oio137 with SMTP id 137so24317006oio.0
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 03:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Vn51t4doscuTNhAIlrOsEjo4kB/+nk9GDUubD5bh8zI=;
	b=dKHAEmLJFNB8uOrtWDCC7z/UwfKTjz2UPSvQ6/IlZ2A8DHX5Q7fH20jtaiQEZCyysW
	yKfpS0TknrfoxYn6D2N84/sqnm2mHMKkANlKPBoHluB8s4evid+rGMKjySgPAbLMXefu
	I6jK1iyH5L2CKz6KXkcAVgHQhKmSEhLor/niqi+oAQ1Vc0mXQ0zztIzMYTEysgwzhr90
	nz+zbsHYErbmj/GXGGW+iOJRrBJmer7KSjZIjvGS2e6dA48yri93FtojeC9ASe8CDaDo
	ozm8mjtJKwld6vUMtjafEAI1IWevi3PufHzOfGuDIiZu2FFMAjOlqKP3VzOiylkAKTSe
	F6BQ==
MIME-Version: 1.0
X-Received: by 10.202.197.86 with SMTP id v83mr11786820oif.88.1439462491306;
	Thu, 13 Aug 2015 03:41:31 -0700 (PDT)
Received: by 10.202.86.131 with HTTP; Thu, 13 Aug 2015 03:41:31 -0700 (PDT)
Received: by 10.202.86.131 with HTTP; Thu, 13 Aug 2015 03:41:31 -0700 (PDT)
In-Reply-To: <20150813093331.GD15357@ad.chargestorm.se>
References: <CADySD0Fs0k-B0G=ZFa_yesxdF7tuvdjjAkfKdBPp0JpS=5EcVw@mail.gmail.com>
	<20150813093331.GD15357@ad.chargestorm.se>
Date: Thu, 13 Aug 2015 22:41:31 +1200
Message-ID: <CADySD0EM1OaWLjZPBczm0EqFP0BzM6oOaX_AEpTgS3s7g+gufg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: Using Valgrind from Yocto doesn't give stack trace
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
X-List-Received-Date: Thu, 13 Aug 2015 10:41:33 -0000
Content-Type: multipart/alternative; boundary=001a1134e93c764130051d2efa06

--001a1134e93c764130051d2efa06
Content-Type: text/plain; charset=UTF-8

Hi Anders,

How to include that package with debug symbols ?
Which packagegroup shall I include in my recipe ?

Thanks for response.

Cheers
Ankur
On 13-Aug-2015 9:33 pm, "Anders Darander" <anders@chargestorm.se> wrote:

> Hi,
>
> * Ankur Tyagi <ankur.tyagi85@gmail.com> [150813 06:25]:
> > I am using Valgrind coming from yocto on my AM335x-EVM kit.
>
> > But when I try to use valgrind, it doesn't give me stack trace. Following
> > is what I get :
>
> I actually got the same question from a customer (on an older TI arm
> core) earlier this summer. So luckily I rember what the fix was...
>
> > ==1732== HEAP SUMMARY:
> > ==1732==     in use at exit: 4 bytes in 1 blocks
> > ==1732==   total heap usage: 2 allocs, 1 frees, 8 bytes allocated
> > ==1732==
> > ==1732== 4 bytes in 1 blocks are definitely lost in loss record 1 of 1
> > ==1732==    at 0x4811FE8: malloc (in
> > /usr/lib/valgrind/vgpreload_memcheck-arm-linux.so)
>
> To get better backtraces than this (which is useless), all you need to
> do is to install the debug symbols for vgpreload_memcheck-arm-linux.so.
>
> As the complete valgrind-dbg package in Yocto is far too big, I just
> created a new package with the debug symbols for
> vgpreload_memcheck-arm-linux.so.  After installing this to our image (or
> just manually copying the debug info for that file into the rootfs), the
> memcheck tool from valgrind will start giving you usefull backtraces and
> thus, a usefull grouping of memory leaks.
>
> Cheers,
> Anders
>
> --
> Anders Darander
> ChargeStorm AB / eStorm AB
>

--001a1134e93c764130051d2efa06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Anders,</p>
<p dir=3D"ltr">How to include that package with debug symbols ? <br>
Which packagegroup shall I include in my recipe ?</p>
<p dir=3D"ltr">Thanks for response.</p>
<p dir=3D"ltr">Cheers<br>
Ankur</p>
<div class=3D"gmail_quote">On 13-Aug-2015 9:33 pm, &quot;Anders Darander&qu=
ot; &lt;<a href=3D"mailto:anders@chargestorm.se">anders@chargestorm.se</a>&=
gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
* Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@=
gmail.com</a>&gt; [150813 06:25]:<br>
&gt; I am using Valgrind coming from yocto on my AM335x-EVM kit.<br>
<br>
&gt; But when I try to use valgrind, it doesn&#39;t give me stack trace. Fo=
llowing<br>
&gt; is what I get :<br>
<br>
I actually got the same question from a customer (on an older TI arm<br>
core) earlier this summer. So luckily I rember what the fix was...<br>
<br>
&gt; =3D=3D1732=3D=3D HEAP SUMMARY:<br>
&gt; =3D=3D1732=3D=3D=C2=A0 =C2=A0 =C2=A0in use at exit: 4 bytes in 1 block=
s<br>
&gt; =3D=3D1732=3D=3D=C2=A0 =C2=A0total heap usage: 2 allocs, 1 frees, 8 by=
tes allocated<br>
&gt; =3D=3D1732=3D=3D<br>
&gt; =3D=3D1732=3D=3D 4 bytes in 1 blocks are definitely lost in loss recor=
d 1 of 1<br>
&gt; =3D=3D1732=3D=3D=C2=A0 =C2=A0 at 0x4811FE8: malloc (in<br>
&gt; /usr/lib/valgrind/vgpreload_memcheck-arm-linux.so)<br>
<br>
To get better backtraces than this (which is useless), all you need to<br>
do is to install the debug symbols for vgpreload_memcheck-arm-linux.so.<br>
<br>
As the complete valgrind-dbg package in Yocto is far too big, I just<br>
created a new package with the debug symbols for<br>
vgpreload_memcheck-arm-linux.so.=C2=A0 After installing this to our image (=
or<br>
just manually copying the debug info for that file into the rootfs), the<br=
>
memcheck tool from valgrind will start giving you usefull backtraces and<br=
>
thus, a usefull grouping of memory leaks.<br>
<br>
Cheers,<br>
Anders<br>
<br>
--<br>
Anders Darander<br>
ChargeStorm AB / eStorm AB<br>
</blockquote></div>

--001a1134e93c764130051d2efa06--
