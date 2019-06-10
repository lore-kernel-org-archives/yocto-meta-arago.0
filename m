Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by arago-project.org (Postfix) with ESMTPS id 404F0529B1
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 22:35:00 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id 131so9560048ljf.4
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 15:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xh59oQSkUWToWztyIYkt2gWniQZmMO/yF1kNXzItWnY=;
	b=VwD8JH/oSYXYP/BvdyLFgB+sxRnfaGsu1obz4daAK9TQ6YKOirbj/rs2IuWFm+3cnY
	A4+6CqGcPHU/jnpTAew89DPyKKlzAnYzQXps9WpXi2k+MbC0riTMFAHq2OfxlUQYvrLM
	tjuPXMjTsz942NKDvSruTon+qhU3qcn4OH4hRJPpwjLL0kR6Wo5QlHe0OKAYNepjNuJs
	9dYQSF4o/conQ/7c6Zc+/v2fqQxgIFUeKlXkqqnP4oLsCIlPA+poGOnPtXEVG+fJ+EEO
	szO+EAUIBECmg3w+eZ+ed3nhUEvoWagT4a/6Z0A3+XFrCMVN9wH6ILZH8Oum971AbYCr
	oo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xh59oQSkUWToWztyIYkt2gWniQZmMO/yF1kNXzItWnY=;
	b=iPGQ4mzstpWo7iHrb+cIQ8U79eUE3Yc89yC3rnvpbcx46q72UVa7syAgYYaGw7FHQx
	oLB+TN3rBbCCyD6b3VT2bqQeqbogCNGCZ+GL5QAHayJyimffGDRcAvTjnJc4g5LTBwem
	BDX4AoZ6/6quOdTmQQ6TpPLdWEOQbc9eoRjbi5OvQH4+UO4/Wm8SDGONTt1jAiFku2Q8
	tdFpNycgdJUr7yN4DT9SMbE/IPGksTJadWHqUqXSEgqHy4bsbJSDQKxpbB3cK7HrTuxl
	lsnsaeTHPNXq1GvvHWM0RXQpSQGCUfXpomF3RNjOA5fMin4+Rk9eCSxAXjbPiYpCSsps
	3wzA==
X-Gm-Message-State: APjAAAUzvYTg0wM/5REAPIZ1ZSm4AjuIe1TPbG0I6RSY6dcljE5TJaR1
	VpkIlI/KagicBsq44kzw1m+fEf2+Z4gqzEOvBp4=
X-Google-Smtp-Source: APXvYqwMR1L1aqz9Q89Em8VIeRBEC9VvuPUKKhQVgmoRKRzrVRymgzi09j6QcHalzwH+du9B6a3pSBVj/8baWIeKDwo=
X-Received: by 2002:a2e:2b01:: with SMTP id q1mr20910818lje.27.1560206060473; 
	Mon, 10 Jun 2019 15:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0Fv+OXf_73cMBEWSr2N0pF4wB=NGESN3987kQ8tLfEUDw@mail.gmail.com>
	<20190610171512.GE25589@beryl>
	<CADySD0GL-ndHy_g8zesfpyW-LagiyFn1-zv88g-sdWmPU6bFGg@mail.gmail.com>
	<20190610222030.GK25589@beryl>
In-Reply-To: <20190610222030.GK25589@beryl>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 11 Jun 2019 10:34:08 +1200
Message-ID: <CADySD0Hoc87AcDYQP23SzzAZBqsNWe7JRkdgQcGDmNiH3ge5Ww@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: Upcoming stable branch
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
X-List-Received-Date: Mon, 10 Jun 2019 22:35:01 -0000
Content-Type: multipart/alternative; boundary="00000000000002d812058affc83d"

--00000000000002d812058affc83d
Content-Type: text/plain; charset="UTF-8"

Ok, thanks for the clarification.
Will use thud branch

On Tue, 11 Jun 2019, 10:20 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:

> No, <release>-next branches are used across many OpenEmbedded/Yocto layers
> exactly the same - for testing changes to that release branch.
>
> Denys
>
>
> On Tue, Jun 11, 2019 at 08:15:41AM +1200, Ankur Tyagi wrote:
> > Thanks Denys.
> >
> > Should I start with thud or thud-next?
> > Is thud-next for next milestone release?.
> >
> > Regards
> > Ankur
> >
> > On Tue, 11 Jun 2019, 5:15 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:
> >
> > > No plans for warrior - we are on a single LTS per year schedule,
> picking
> > > up
> > > only Fall even releases and skipping Spring odd ones.
> > >
> > > Denys
> > >
> > >
> > > On Mon, Jun 10, 2019 at 08:14:21AM +1200, Ankur Tyagi wrote:
> > > > Hi,
> > > >
> > > > We are planning to upgrade arago distro in our product.
> > > > At this point, I can only see thud branch in meta-arago whereas
> warrior
> > > is
> > > > available in oe-core.
> > > >
> > > > Is there any plan for warrior in meta-arago or is it being skipped?
> > > > What is the difference between thud and thud-next?
> > > >
> > > > Thanks
> > > > Ankur
> > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> > >
>

--00000000000002d812058affc83d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, thanks for the clarification.=C2=A0<div dir=3D"auto">=
Will use thud branch</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, 11 Jun 2019, 10:20 a.m. Denys Dmytriyenko=
, &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">No, &lt;release&gt;-next branches are used a=
cross many OpenEmbedded/Yocto layers <br>
exactly the same - for testing changes to that release branch.<br>
<br>
Denys<br>
<br>
<br>
On Tue, Jun 11, 2019 at 08:15:41AM +1200, Ankur Tyagi wrote:<br>
&gt; Thanks Denys.<br>
&gt; <br>
&gt; Should I start with thud or thud-next?<br>
&gt; Is thud-next for next milestone release?.<br>
&gt; <br>
&gt; Regards<br>
&gt; Ankur<br>
&gt; <br>
&gt; On Tue, 11 Jun 2019, 5:15 a.m. Denys Dmytriyenko, &lt;<a href=3D"mailt=
o:denys@ti.com" target=3D"_blank" rel=3D"noreferrer">denys@ti.com</a>&gt; w=
rote:<br>
&gt; <br>
&gt; &gt; No plans for warrior - we are on a single LTS per year schedule, =
picking<br>
&gt; &gt; up<br>
&gt; &gt; only Fall even releases and skipping Spring odd ones.<br>
&gt; &gt;<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Jun 10, 2019 at 08:14:21AM +1200, Ankur Tyagi wrote:<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We are planning to upgrade arago distro in our product.<br>
&gt; &gt; &gt; At this point, I can only see thud branch in meta-arago wher=
eas warrior<br>
&gt; &gt; is<br>
&gt; &gt; &gt; available in oe-core.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is there any plan for warrior in meta-arago or is it being s=
kipped?<br>
&gt; &gt; &gt; What is the difference between thud and thud-next?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks<br>
&gt; &gt; &gt; Ankur<br>
&gt; &gt;<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; meta-arago mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_b=
lank" rel=3D"noreferrer">meta-arago@arago-project.org</a><br>
&gt; &gt; &gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo=
/meta-arago" rel=3D"noreferrer noreferrer" target=3D"_blank">http://arago-p=
roject.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div>

--00000000000002d812058affc83d--
