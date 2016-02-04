Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by arago-project.org (Postfix) with ESMTPS id 6BAF3529EA
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 18:19:04 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id e185so41761852vkb.1
	for <meta-arago@arago-project.org>;
	Thu, 04 Feb 2016 10:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wwIg/Kmetqc8EIeqkBKhIcZnb5kj/r3wAGd0zf1+t7M=;
	b=PNUsKZ48faDYSQUiHHrYA8CGpPEnwlicgB6f1hUnMnPAdaIBzM7SYsYsun3GBykpRl
	IHp0YMCF1UJ988PUPoY++yClMvOyAdVkNqoyhmoDE0RJJYqAmc++PQlQmFByZ/9L6pmO
	Kmr4qtUa0iqLmzbJ2CXVfswmIyB+sjT9YJ9t6iT96KDhBLuIKnratL4fBfXuiLgEOT94
	v4pcLJKtxrnQTV27monsu6/17+uuefsv2wtRLXC4/JWdjeWp8XixmGExzdLPaNIEk3rj
	eje9cWELelgbLC/iZupvWD1uOeTMRayMUPJ/uQR6Zw88sfLfVsHRZMMpIK0vPs6xXIMV
	GKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=wwIg/Kmetqc8EIeqkBKhIcZnb5kj/r3wAGd0zf1+t7M=;
	b=VDeI/YI7dlj2hacG9yD4FVqiX62I5WAQvs+FhhfELHmnewv5APsvGbmzLPPamdd6RF
	JN9DHBdeggtoBvxN3ZlfAxtfIHTjgmmxsN2PBDvGNoiFjwzGWQMnW++3+25VLw6OyCGX
	l6vef2viWFRGGsnHzmS7xNv3GWQi/6vs9UDn5NnWCgUSrUnMhk5hxZFQ01mcErBxTmJ9
	90SAMhG3XqUNNeL9o4oir/ezdICNu78fzfUWspGeQJQIKtxY8etGzBfrZNA2g5Cvbs4r
	OOzAXTzvHHIesuTy7kgy7a3xRK9KjK55LwYu2uyQ8upgKqaUUVLdvgPKTOGegsoA6Hcx
	uYXg==
X-Gm-Message-State: AG10YOQqueXuADdSEvdMz1v2w8AG/WRttSKw+8lMKjUmFC/6tt0P2uDZxAhbiXRTdElBJbwA0FwwXzKypByhtQ==
MIME-Version: 1.0
X-Received: by 10.31.48.132 with SMTP id w126mr6586649vkw.5.1454609944066;
	Thu, 04 Feb 2016 10:19:04 -0800 (PST)
Received: by 10.31.146.65 with HTTP; Thu, 4 Feb 2016 10:19:04 -0800 (PST)
Received: by 10.31.146.65 with HTTP; Thu, 4 Feb 2016 10:19:04 -0800 (PST)
In-Reply-To: <CADySD0HXCNyRq3_cHJpO2WQWGnVCd9rNS-B1g09vAUN5cKMdrw@mail.gmail.com>
References: <CADySD0HXCNyRq3_cHJpO2WQWGnVCd9rNS-B1g09vAUN5cKMdrw@mail.gmail.com>
Date: Fri, 5 Feb 2016 07:19:04 +1300
Message-ID: <CADySD0EPPjwq-iDeGEzWW_yVTf582T0OfYpO7OBvpOCcPyus9A@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: Graphics binary for AM335x-EVM in fido
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
X-List-Received-Date: Thu, 04 Feb 2016 18:19:04 -0000
Content-Type: multipart/alternative; boundary=001a11430e0e00bedb052af5c53e

--001a11430e0e00bedb052af5c53e
Content-Type: text/plain; charset=UTF-8

Forgot to mention that I dont have "x11 Wayland" in distro features.

Thanks
Ankur
On 02-Feb-2016 10:10 pm, "Ankur Tyagi" <ankur.tyagi85@gmail.com> wrote:

> Hi,
>
> For AM335x-EVM, with arago-daisy config, libgles-omap3 was used.
>
> Whereas in arago-fido config,  libgbm, omap5-sgx-ddk-um-linux and
> omapdrm-pvr are used.
>
> I would like to know the advantage of this change.
>
> Because of this new change, my QT5 application which was working with
> daisy branch is crashing on fido.
>
> Is it okay if I roll back to libgles-omap3 for am335x-evm on fido ?
>
> thanks
> Ankur
>

--001a11430e0e00bedb052af5c53e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Forgot to mention that I dont have &quot;x11 Wayland&quot; i=
n distro features.</p>
<p dir=3D"ltr">Thanks<br>
Ankur</p>
<div class=3D"gmail_quote">On 02-Feb-2016 10:10 pm, &quot;Ankur Tyagi&quot;=
 &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>=
&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Hi,<br><br>For AM335x-EVM, with arago-daisy config, libgles-omap3 =
was used.<br><br>Whereas in arago-fido config, =C2=A0libgbm, omap5-sgx-ddk-=
um-linux and omapdrm-pvr are used.<br><br>I would like to know the advantag=
e of this change. <br><br>Because of this new change, my QT5 application wh=
ich was working with daisy branch is crashing on fido.<br><br>Is it okay if=
 I roll back to libgles-omap3 for am335x-evm on fido ?<br><br>thanks<br>Ank=
ur</div>
</blockquote></div>

--001a11430e0e00bedb052af5c53e--
