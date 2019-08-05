Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by arago-project.org (Postfix) with ESMTPS id 09E5B5298A
	for <meta-arago@arago-project.org>;
	Mon,  5 Aug 2019 03:21:42 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id z28so23717893ljn.4
	for <meta-arago@arago-project.org>;
	Sun, 04 Aug 2019 20:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wEf+LxJ20XJsWcYWatq0VIoDJ9dF1me3+tMK9sUpzxE=;
	b=KT8UR4ixdPh4t8g3BXlgD99axqRE/eZ1BnY2pAEwVAB9DrzD73+zlnRvpGEBL/RDzB
	w913ZVy4wlaJqrdMPxhG6Y0acbrezq8XL68ILgOjg/Wozrew8E8u/Kk28eO7aE3lUhmU
	HAYxpZ0a7bKjLlzVw/30lPcnMMcPGCNwK5pGJO/wqnEQ0t/bjTmydpgi65y6cgJrETYU
	Uh0nVYWNWd2plyIyQWnf3kkBVOIN1czoh35GpOvnF752Q2DQfPOv9aVi+RgBPQfCC4LU
	95FyzC03oBpvHKj231w7ea8Mu6yD3W6ombYEIJdEGG5CxiQZkQrV745bFQRgZ02yuRZM
	l2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wEf+LxJ20XJsWcYWatq0VIoDJ9dF1me3+tMK9sUpzxE=;
	b=jbRJGfg45l+G/SlBEa5b/NfKOciz3b1TPZ+noNgQ6Y0tlH+6aJrqEBtgKjlQelHvab
	rPwrGJ2tLJ+Mr4NFK6G7RjYaC02C/Wcreo7NOkdoF+TULh7O6+h78RZK3lXBB+7aWyeU
	CfoSw4PcTFuCr06VcYCTMBeNQrxhE+nE8CTi+X1dnqq/FB9QxTjZ+pbACKukBRgBS29+
	3sgwv3imEMu4NXGo4YYF9pGePLhLqGjlXTgkO5f/5B0tfCTWQY1yACu6mY7DYgggeiiT
	2vIGi27PE2AcNCh5Gf04/a8OMBsVJqtgGeJbKvYDdFW/hNcAvCjtDW8j+6DKjr296WuM
	XZgw==
X-Gm-Message-State: APjAAAX5ockVp/A5TbCaPvYe3ZZqh3Woetc+P4wdzUdoU1fYkyktLGz0
	FU0fzs27kEJtbflN8VVFHBcTtT8UO5v4AG3tOgU=
X-Google-Smtp-Source: APXvYqyih5akB0rYfLpBf4hNccYMrChSBptHSVGwFLsuaj/pVFejnspPgInzu2wfVMilrsgfEy5qt1mV48qeZe/KKLQ=
X-Received: by 2002:a2e:a171:: with SMTP id u17mr32444650ljl.209.1564975245952;
	Sun, 04 Aug 2019 20:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0Hx78etbUEEQJJuNScZU9hp1gHDoxyX_pKiJZt5O-DkWQ@mail.gmail.com>
	<20190805013631.GA19505@beryl>
In-Reply-To: <20190805013631.GA19505@beryl>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 4 Aug 2019 20:20:33 -0700
Message-ID: <CADySD0EvEmL-4n-nh=vEVnRWjcGiWPUEfiP1Fg9dMZF9=tA+tw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: wpa-supplicant and hostap depends on openssl10
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
X-List-Received-Date: Mon, 05 Aug 2019 03:21:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 4, 2019 at 6:36 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Sun, Aug 04, 2019 at 12:58:48PM +1200, Ankur Tyagi wrote:
> > Hi,
> >
> > When building eSDK for arago based image, I am getting following error:
> >
> > "The file /usr/include/openssl/comp.h is installed by both openssl10
> > and openssl, aborting"
> >
> > I checked who depends on openssl10 and only meta-arago wpa-supplicant,
> > hostap depends whereas upstream depends on openssl.
> >
> > Below commits show the change to depend on openssl10:
> >
> > commit bc88360b: wpa-supplicant: inherit pkgconfig and depend on openssl10
> > commit 8c3e159b: hostap: inherit pkgconfig and depend on openssl10
> >
> > Any specific reason to still depend on openssl10?
>
> Compatibility? OpenSSL 1.1 API is not 100% compatible with OpenSSL 1.0
>

But upstream wpa_supplicant is using OpenSSL 1.1. Shouldn't meta-arago
also switch to the same?
Even if meta-arago depends on OpenSSL 1.0, then how to fix eSDK error ?

regards
Ankur
> --
> Denys

