Return-Path: <008dilip@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id CC58952A76
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 18:12:45 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id m1so1137367oag.31
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 10:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JryXV188JnH6HaLuqd50IxkeZ+f4WazSADBZaaBGdRo=;
	b=SLeg93Fi1e5J7JDXkNl2T+GumPTwX5ZgMZx/1E+c4dmyCsg2v2AKQQcSBIRF8xMiLp
	RShG1OZJsGMfa8Qe+HBzJTKqXQ0G+ZPRIB9g0BSVrrxqQRzq9INlOgUpKe1E5TONdAq7
	PkubNKAXSmR1bSo40htbJIsG0ReMGMl3GSgw0d1gIdStQ6kY0Go4WDERpd+7l3vNE6r3
	tHXGFgBk8/g6StcjadBRwlwSw7sg+EHuHCsw7N28ZGtT/6Seh6uGKyef9Z3kwNdhqDUQ
	s/RNZ67Nw/JD/epPmAc8yv3DoqrixrMT3le/uRx2zn+kK4MLfWt7TSUJxUAqUzEnlLMA
	mr7A==
MIME-Version: 1.0
X-Received: by 10.182.113.195 with SMTP id ja3mr3216283obb.46.1384884764990;
	Tue, 19 Nov 2013 10:12:44 -0800 (PST)
Received: by 10.76.177.34 with HTTP; Tue, 19 Nov 2013 10:12:44 -0800 (PST)
Received: by 10.76.177.34 with HTTP; Tue, 19 Nov 2013 10:12:44 -0800 (PST)
In-Reply-To: <20131119180230.GD27758@edge>
References: <CABmxB3MGD26wRTWVw_tzfX1tHng8BXLYgvpujgrXcvQOsexRRA@mail.gmail.com>
	<20131119180230.GD27758@edge>
Date: Tue, 19 Nov 2013 23:42:44 +0530
Message-ID: <CABmxB3MjUhcZz52=Ob6m4oWuic9tx_bvYZmiM6Twmqzaak5Xuw@mail.gmail.com>
From: Dilip Kumar <008dilip@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: Ltp-ddt into Yocto project
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
X-List-Received-Date: Tue, 19 Nov 2013 18:12:46 -0000
Content-Type: multipart/alternative; boundary=089e013d0db078e1d604eb8b9cda

--089e013d0db078e1d604eb8b9cda
Content-Type: text/plain; charset=ISO-8859-1

Thank you for your response.

regards
dilip kumar b
On 19-Nov-2013 11:32 pm, "Denys Dmytriyenko" <denys@ti.com> wrote:

> On Tue, Nov 19, 2013 at 11:28:42PM +0530, Dilip Kumar wrote:
> > Hi all,
> >
> > This is my first mail to the arago mailing list.
> >
> > I need to whether it is possible to add ltp-ddt to into the existing
> > default Yocto project build, I.e in poky dylan distribution and to run in
> > qemulator. If is it possible, May I know how we can add the test tool
> ltp-
> > ddt and procedure for adding like which recipe to add or which layer to
> be
> > added.
> > I am waiting for your response.
>
> First of all, ltp-ddt is already in meta-openembedded, but unfortunately
> it's
> quite old there. Since it is actively being developed, we keep an
> AUTOREV-ed
> recipe in meta-arago. So, you can either update the recipe in meta-oe with
> the
> recent SRCREV, or just add meta-arago-extras layer into your poky build. It
> should not conflict with Poky distro, as Arago distro specifics are in own
> meta-arago-distro layer.
>
> Second, ltp-ddt is very machine specific as it exercises machine-specifici
> peripherals, so I doubt it will run under qemu...
>
> --
> Denys
>

--089e013d0db078e1d604eb8b9cda
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Thank you for your response.</p>
<p dir=3D"ltr">regards <br>
dilip kumar b</p>
<div class=3D"gmail_quote">On 19-Nov-2013 11:32 pm, &quot;Denys Dmytriyenko=
&quot; &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br t=
ype=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Tue, Nov 19, 2013 at 11:28:42PM +0530, Dilip Kumar wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; This is my first mail to the arago mailing list.<br>
&gt;<br>
&gt; I need to whether it is possible to add ltp-ddt to into the existing<b=
r>
&gt; default Yocto project build, I.e in poky dylan distribution and to run=
 in<br>
&gt; qemulator. If is it possible, May I know how we can add the test tool =
ltp-<br>
&gt; ddt and procedure for adding like which recipe to add or which layer t=
o be<br>
&gt; added.<br>
&gt; I am waiting for your response.<br>
<br>
First of all, ltp-ddt is already in meta-openembedded, but unfortunately it=
&#39;s<br>
quite old there. Since it is actively being developed, we keep an AUTOREV-e=
d<br>
recipe in meta-arago. So, you can either update the recipe in meta-oe with =
the<br>
recent SRCREV, or just add meta-arago-extras layer into your poky build. It=
<br>
should not conflict with Poky distro, as Arago distro specifics are in own<=
br>
meta-arago-distro layer.<br>
<br>
Second, ltp-ddt is very machine specific as it exercises machine-specifici<=
br>
peripherals, so I doubt it will run under qemu...<br>
<br>
--<br>
Denys<br>
</blockquote></div>

--089e013d0db078e1d604eb8b9cda--
