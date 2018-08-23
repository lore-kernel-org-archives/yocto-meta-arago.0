Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by arago-project.org (Postfix) with ESMTPS id 3F85052A2A
	for <meta-arago@arago-project.org>;
	Thu, 23 Aug 2018 20:44:32 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k12-v6so11641847oiw.8
	for <meta-arago@arago-project.org>;
	Thu, 23 Aug 2018 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WpD8TcNuPu7AK7FCDPsXmEFqSK0QHapdzC4Ea621ztc=;
	b=NZ/8bWlYjgRi9W7EgaIwjodPAcdobIxOD9ORczVtIFef2tN3qDLw5sSd+6/QuUW8Ns
	1DHKUa+1Vr3SgsF6BjORyX6tFvozDdtnVS9buRND7EzyQ6mahuK28moECq6cyvpBP0NB
	Q+OqbroKF3P46YKFrbyhyX4qrlbKhfopMi2gNhagRPr6jKuenOjGj266V42FSdGXSLA+
	E99mmPoEfJxK+kcUWCsPT+dX57SVT7qgVQ7dQODjJmkLpviqeU73gsBTm1Rbfkxh0SS2
	l4vSXuEE3lP3uoa3JM5mdalA+2M0Wq+qukZX/TqmGWw6JuLfFYeFrR6wWfNXfDmeeU95
	C5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WpD8TcNuPu7AK7FCDPsXmEFqSK0QHapdzC4Ea621ztc=;
	b=FIuY5FDrf1Fk4egNR0p9oSMUSXYjoLyDxx34BpQJcpyzcHZYTz8sy9QbjunCRPv7El
	R1fbXXcZjdcG06pVLCNpuRHP6orYtGAweKEijDffESbEljJK3CymaPaYhHcOjwcGTl+7
	DdiETjAmUtjL2/RRrDtJDGO4mms2+8CmTYpNlgd4RkLM+x85NtLHnIOc1MiautiSLrsJ
	8SEDxOZU3hLOmTazmsdzck96ZJrxHuBelnQbMC2jZRMleRwY9VMXQL3YbkOZC1imU1Ug
	QhwZOKEoKfwjQK0Mfrhqd+1HXNIk9qOt3iVXIzbvoiUtxb9Dpd+e9fI8lG3kTOr40qtK
	e/Gg==
X-Gm-Message-State: APzg51CtuEuS9JfiK1yfq0ANn4CgQkrmE8fseciTtGhMg5Qad9v2BRy/
	jzD98t5sIeXRA6W3vaiEroTBk5pwOtBnBCiy3kp7dQ==
X-Google-Smtp-Source: ANB0VdagvHORpy9+dbNFuPo62P+L6f9L7/x0QA/QBSWBh51P9N0jnwTPrsY5thGlaiP/PdTEe/LUWsySAM5LfqTeEn0=
X-Received: by 2002:aca:18d:: with SMTP id 135-v6mr9148469oib.2.1535057064607; 
	Thu, 23 Aug 2018 13:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0FuPUPG5qwFC8Ao2eiKVtYhE8Gq9N-0RMvFZk0RKp=d+A@mail.gmail.com>
	<20180823170304.GT29422@beryl>
In-Reply-To: <20180823170304.GT29422@beryl>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 24 Aug 2018 08:44:12 +1200
Message-ID: <CADySD0FngjaM9BL6_rvBVmPFshGZjd=7RS=ku7eC9F=T_5Of9Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: How to submit patch for ti-u-boot.git
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
X-List-Received-Date: Thu, 23 Aug 2018 20:44:32 -0000
Content-Type: multipart/alternative; boundary="0000000000000bc4340574205386"

--0000000000000bc4340574205386
Content-Type: text/plain; charset="UTF-8"

I think so, I will send it upstream.

Thanks
Ankur

On Fri 24 Aug, 2018, 5:04 AM Denys Dmytriyenko, <denys@ti.com> wrote:

> Can it go upstream to mainline U-boot at DENX?
>
> On Thu, Aug 23, 2018 at 11:29:11AM +1200, Ankur Tyagi wrote:
> > Hi,
> >
> > I want to submit a patch series for TI u-boot.
> > Don't know to which mailing list shall I post them.
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

--0000000000000bc4340574205386
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think so, I will send it upstream.<div dir=3D"auto"><br=
></div><div dir=3D"auto">Thanks</div><div dir=3D"auto">Ankur</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri 24 Aug, 2018, 5:04 AM D=
enys Dmytriyenko, &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Can it go upstream to mainli=
ne U-boot at DENX?<br>
<br>
On Thu, Aug 23, 2018 at 11:29:11AM +1200, Ankur Tyagi wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I want to submit a patch series for TI u-boot.<br>
&gt; Don&#39;t know to which mailing list shall I post them.<br>
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

--0000000000000bc4340574205386--
