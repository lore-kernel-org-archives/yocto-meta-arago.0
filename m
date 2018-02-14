Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by arago-project.org (Postfix) with ESMTPS id 859BD529AB
	for <meta-arago@arago-project.org>;
	Wed, 14 Feb 2018 14:47:49 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id p2so1233678ywg.10
	for <meta-arago@arago-project.org>;
	Wed, 14 Feb 2018 06:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=akv0lv2fwEmnzdEHmghu+3LcbRd4gqZ/i4ARussqZP8=;
	b=su8JCuAo3uXt/T6/ROCF++MXegNZl+tLKpnx5+wYKZbhX76uKI5ixvAe+r6/SkuiEq
	X3bOJ0/efWGNlA3CfIddX+kbnrUKtUr2v/HkbFTahhQHUsqJm+bGn/W0uEwcSmWvMSTs
	NQ6tGrw6FjAz2wi9k2OB8kiNgrQlbjIyyFKSl6e+6GYlJLZt8ZwMxW1OC103Qph8SM0v
	SwOQaHLer6mpCqJTI2rPx8pWV4ohrF1R8bkzrAjLo9yIoTGmJBAQwZSp8iHxMh1Gj1Aa
	yeF5ubJLwlRm5EgIatYLpZgwV5vs7fZY40ERMSB/uywOs5V7GqtORm2xZ1MMbt1pia6e
	8wyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=akv0lv2fwEmnzdEHmghu+3LcbRd4gqZ/i4ARussqZP8=;
	b=OQsdeOZOaAuiKd9tmBP5DPjHu4LjyLxcvav0P8Ha3y4eAOuwm2g61uBdx82Gk8FCcC
	XHvcgpL2zhFkEnd8LWtcHcEne8fjvI7ExNK8ro0ixXEfoHIjPByT8XNT/xh3rw8lSivQ
	NGJUh682Oe3KQvcP967t/+tKm9WVYXnJ7Vj9Tk2OqZdPGYTW6Ga1JGwKicsCl9BZ7qUs
	lhfcY8ZAgx5xBcM2hbncfUkNA06g7+NjNKOCiGLDP+XlSMfx4V8AjXKSIj1XRLlceXbI
	L9Yu0K29RnMroPO3x+4W6T01l/6MKKBZydwUi+ZneOgah0hszjOGNmFBxZWix+T3xJwm
	7clA==
X-Gm-Message-State: APf1xPDYZUz/6Hk9tCh5/x/FcyzXHbG3ls2Ye0yJAZOwYnAIc6dVA3px
	w5W+AoijP/0fdpgLWBiDBNpi+YrNRtqnfiGuWhk=
X-Google-Smtp-Source: AH8x2242Yj/1Ghv8KZyhbmLMagaSalR413X+xgmEcks6c+bsAhNK0VahqUKnXdZzbAUnQaXGz2mx0JCp90cedML+bUw=
X-Received: by 10.37.63.1 with SMTP id m1mr3265365yba.489.1518619652680; Wed,
	14 Feb 2018 06:47:32 -0800 (PST)
MIME-Version: 1.0
References: <CAFeBWL525C75dwezNganhmoQ2gTRQ-ppbUcxT3r5MJCBwHWVQQ@mail.gmail.com>
	<20180214144625.GL31854@edge>
In-Reply-To: <20180214144625.GL31854@edge>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 14 Feb 2018 14:47:22 +0000
Message-ID: <CAFeBWL4ABx1nuuQdexo5w8CV7sxL7T_Snzh_4+jKaZ=nv=O54w@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: Gforge dicommissioned
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
X-List-Received-Date: Wed, 14 Feb 2018 14:47:49 -0000
Content-Type: multipart/alternative; boundary="001a114bd40ef2700405652d30c4"

--001a114bd40ef2700405652d30c4
Content-Type: text/plain; charset="UTF-8"

Appreciate prompt response.
Is there a work-around on this yet?

BR,

Adam

On Wed, Feb 14, 2018 at 9:46 AM Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Feb 14, 2018 at 02:45:27PM +0000, Adam Lee wrote:
> > It looks like gforge.ti.com has been decommissioned.
> > I am getting fetch failures and there are no working mirrors.
>
> Yes, we know.
>
> --
> Denys
>

--001a114bd40ef2700405652d30c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Appreciate prompt response.<div>Is there a work-around on =
this yet?<div><br></div><div>BR,</div><div><br></div><div>Adam</div></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Feb 14, 2018 a=
t 9:46 AM Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Feb 14, 20=
18 at 02:45:27PM +0000, Adam Lee wrote:<br>
&gt; It looks like <a href=3D"http://gforge.ti.com" rel=3D"noreferrer" targ=
et=3D"_blank">gforge.ti.com</a> has been decommissioned.<br>
&gt; I am getting fetch failures and there are no working mirrors.<br>
<br>
Yes, we know.<br>
<br>
--<br>
Denys<br>
</blockquote></div>

--001a114bd40ef2700405652d30c4--
