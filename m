Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by arago-project.org (Postfix) with ESMTPS id 4D1BA520E0
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 20:16:34 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id y198so7581562lfa.1
	for <meta-arago@arago-project.org>;
	Mon, 10 Jun 2019 13:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RUe1BPyoMi47SmsXea8YsdNvWhfsKBigJSRcRAZJVnE=;
	b=AZCmk2s1ihchSCXZt7ma5xh+JGNhM4EZp0ha4XTab0KWk5y4vdraampgRwjb2pnP0G
	AdnuD+fMWrI6Aje4gHe/pZhisgOFgjxg3w+yrggIqLfhXFAQGLqcOetSvSPLWsc2u+v6
	hM8qxrDOy8dwgJBhygtXhbORZ8fNm0jqdqIvZ0VaVP9B5YTuU2jskRyC+RV+60mYptvE
	9GQTeV4zFB9KRBCdvZntRlVS1IgSMpaiZJeO1pBKySwyDuFUvYWceYWnR6gZuaeWwXJs
	+FFhM2YnMOrIwy70f/w4R2B+Eclalrej71nnJ2zDFWlSgZ+ucQezhX3A0PyoB2VY2p+O
	c5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RUe1BPyoMi47SmsXea8YsdNvWhfsKBigJSRcRAZJVnE=;
	b=aUltCiLz72+lavzYdIx0goZ45KAobAdALkn1OuB3YsuRBayF4jMx2oExuThHWM3pcP
	M2guvOhNg/3od21aSJ+07gg5x0OnvGyTBwXiOHd3nQpxmRDN2fm2k0RaLMoE8S3jeWr4
	3X+GSlfslFFadbQfU05+a0TdZXL6WdLwcb/D9xJAj3n18waj92ROJhib6Z+e1EDauZ55
	jb7OZhC1V3hRh4mkaDn8dp7Li2+9rhoblnXmQ02XDIhFZVdmNvaVlaizGh00OhS196vv
	N8XY/sNI3q+j4c3v5LiWx7FKrDmY48mpIXgHAY3LpkARTpY3K4auhj3wF982XoP1uChY
	dM5A==
X-Gm-Message-State: APjAAAUlwZqTgY+Hi3fKlyJp4dZIGWGGj3Rfxh06yB3k/njxCIsxlvMK
	iaIYedFIkxz6Mr6ejlzjWAWhWatF2bsGLVBezMw=
X-Google-Smtp-Source: APXvYqwPv/edUs+8+vdCgfZaDP73XdyJmfFBTuX33/oqSTFCP/lafDpQ5T9o3p/yjlzKfQVmR+Nk6/v/SSOPgiBS914=
X-Received: by 2002:a19:ee16:: with SMTP id g22mr8689062lfb.71.1560197754648; 
	Mon, 10 Jun 2019 13:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0Fv+OXf_73cMBEWSr2N0pF4wB=NGESN3987kQ8tLfEUDw@mail.gmail.com>
	<20190610171512.GE25589@beryl>
In-Reply-To: <20190610171512.GE25589@beryl>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 11 Jun 2019 08:15:41 +1200
Message-ID: <CADySD0GL-ndHy_g8zesfpyW-LagiyFn1-zv88g-sdWmPU6bFGg@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Jun 2019 20:16:34 -0000
Content-Type: multipart/alternative; boundary="000000000000f1ff1b058afdd80b"

--000000000000f1ff1b058afdd80b
Content-Type: text/plain; charset="UTF-8"

Thanks Denys.

Should I start with thud or thud-next?
Is thud-next for next milestone release?.

Regards
Ankur

On Tue, 11 Jun 2019, 5:15 a.m. Denys Dmytriyenko, <denys@ti.com> wrote:

> No plans for warrior - we are on a single LTS per year schedule, picking
> up
> only Fall even releases and skipping Spring odd ones.
>
> Denys
>
>
> On Mon, Jun 10, 2019 at 08:14:21AM +1200, Ankur Tyagi wrote:
> > Hi,
> >
> > We are planning to upgrade arago distro in our product.
> > At this point, I can only see thud branch in meta-arago whereas warrior
> is
> > available in oe-core.
> >
> > Is there any plan for warrior in meta-arago or is it being skipped?
> > What is the difference between thud and thud-next?
> >
> > Thanks
> > Ankur
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--000000000000f1ff1b058afdd80b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks Denys.<div dir=3D"auto"><br></div><div dir=3D"auto=
"><span style=3D"font-family:sans-serif">Should I start with thud or thud-n=
ext?</span><br></div><div dir=3D"auto">Is thud-next for next milestone rele=
ase?.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards</div><div =
dir=3D"auto">Ankur</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, 11 Jun 2019, 5:15 a.m. Denys Dmytriyenko, &=
lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">No plans for warrior - we are on a single LTS p=
er year schedule, picking up <br>
only Fall even releases and skipping Spring odd ones.<br>
<br>
Denys<br>
<br>
<br>
On Mon, Jun 10, 2019 at 08:14:21AM +1200, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; We are planning to upgrade arago distro in our product.<br>
&gt; At this point, I can only see thud branch in meta-arago whereas warrio=
r is<br>
&gt; available in oe-core.<br>
&gt; <br>
&gt; Is there any plan for warrior in meta-arago or is it being skipped?<br=
>
&gt; What is the difference between thud and thud-next?<br>
&gt; <br>
&gt; Thanks<br>
&gt; Ankur<br>
<br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank" rel=
=3D"noreferrer">meta-arago@arago-project.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer noreferrer" target=3D"_blank">http://arago-project.org=
/cgi-bin/mailman/listinfo/meta-arago</a><br>
<br>
</blockquote></div>

--000000000000f1ff1b058afdd80b--
