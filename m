Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by arago-project.org (Postfix) with ESMTPS id 1F77F5299C
	for <meta-arago@arago-project.org>;
	Fri, 15 Apr 2016 15:28:28 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id o6so39222695qkc.2
	for <meta-arago@arago-project.org>;
	Fri, 15 Apr 2016 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=QubBNdAIAtPgLFSynbgal96XG2ayEcH7G5Eo7DUUJ4E=;
	b=plwCsWVJhgCWxEDn7zGWKiPexLnabH1/rHb/LY0Hf/u7w8OE0zvZ0TpFH+vhfsqp8c
	fgKtUl1Lu8UYUYZIyKJcpm0QhqiziZpFdK1NW74f8sw9qn3Qgy9astSGeXycgPQD7mYd
	CxjsaWY366bX5TV45VYEQsq38WmZfdpZX4k9w8PaEaHetC1YeCFAEbCBHoaFruVgUq86
	dcONPnGYz9GSFGrBdEoc4D3lzSeL+YvWP/4VZz6Q+Ev6Z4v7OgsCIZxUj+ivRzakrl49
	bYuZIhEfaaZniVyrGJ6Bq07nxazd2SjuFlsQvLnwAzkwimLWYhruaD2PCf6hQNuELWjz
	Y/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=QubBNdAIAtPgLFSynbgal96XG2ayEcH7G5Eo7DUUJ4E=;
	b=PBwOySrezDAMgb8FmITL1eiCamsR3MusB28LCQ2+NrPRiemc3c015VMhm0iTkabvFG
	/IEAeaH3u51Wf25IGUt8PQkFMproYknDcLLDGPq7k0bQg9lJpVEjCQpF5Dbpgb7fZCgx
	BlL6VU11S+NC/ymjFTPwzy1rwvwhezNWsNW08jUQfpOocWI84bV48Phw5T3tQf/Tu9yL
	1PsD1Wb3pV9S+Ye49zrj7uIxvbJKb9UjeUpVC+r8DIzxZj5jGIWbe/oKRq8Ixszc+vrq
	UNYeX+dFZ5JBTDPrXN73rC1cu1EtLcrWGct6w9RGpuHv3wTWW5FD1c6ZLXb4Y+fbXNhs
	Flmw==
X-Gm-Message-State: AOPr4FV7s2HGHFn8YfyH3jewFvnn9sSZrK5IvPmqiilSib/Lvi0tHEzNNZOzCFue0cugsAaA2l71GLmsb8Cdug==
MIME-Version: 1.0
X-Received: by 10.55.77.205 with SMTP id a196mr27274237qkb.94.1460734107702;
	Fri, 15 Apr 2016 08:28:27 -0700 (PDT)
Received: by 10.55.113.66 with HTTP; Fri, 15 Apr 2016 08:28:27 -0700 (PDT)
In-Reply-To: <CADnUhn17zUFiAqUG5eFPibou2apR7r4LgqJqXDTvO7=pZ52K+g@mail.gmail.com>
References: <CADnUhn17zUFiAqUG5eFPibou2apR7r4LgqJqXDTvO7=pZ52K+g@mail.gmail.com>
Date: Fri, 15 Apr 2016 18:28:27 +0300
Message-ID: <CADnUhn2ozMk9vFOGWk6M6bYZVeyd-5-VkPBiFF-_fyN2iQne0Q@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: Re: linux-ti-staging-rt_4.1 does not create /sys/devices/system/cpu/cpu0/cpufreq directory
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
X-List-Received-Date: Fri, 15 Apr 2016 15:28:28 -0000
Content-Type: multipart/alternative; boundary=001a114a7fec99f9d6053087a9d7

--001a114a7fec99f9d6053087a9d7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I got it working thanks to kind help from e2e.ti.
Changes suggested to get these settings match with the defaults were:
* All the
CONFIG_CPU_FREQ_GOV_*=3Dy

while I had only
CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy

* Also
CONFIG_CPUFREQ_DT=3Dm
CONFIG_CPUFREQ_VOLTDM=3Dy

that I had =E2=80=9Cnot set=E2=80=9D

Cheers,
Matti

2016-04-15 12:57 GMT+03:00 matti kaasinen <matti.kaasinen@gmail.com>:

> Hi!
>
> I can't verify/control Dynamic Voltage and Frequency Scaling on my am335x
> based board as  /sys/devices/system/cpu/cpu0/cpufreq directory is not
> created. I already asked this from TI e2e forum and thanks to hint from
> there I found a problem from kernel configuration options. There is no
> "Dynamic Frequency Scaling" option present in:
> menuconfig tree: "System Type" -> "TI OMAP Common Features".
>
> I tried this also without my own defconfig loaded with similar results.
>
> I should have pretty recent meta-ti tree but not necessarily quite up-to
> date. Should it need updated/do I need some kind of patching. Or is this
> feature just not available in RT kernel?
>
> Thanks,
> Matti
>

--001a114a7fec99f9d6053087a9d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I got it working thanks to kind help from e2e.ti=
. <br>Changes suggested to get these settings match with the defaults were:=
<br>* All the <br>CONFIG_CPU_FREQ_GOV_*=3Dy<br><br>while I had only <br>CON=
FIG_CPU_FREQ_GOV_ONDEMAND=3Dy<br><br>* Also<br>CONFIG_CPUFREQ_DT=3Dm<br>CON=
FIG_CPUFREQ_VOLTDM=3Dy<br><br>that I had =E2=80=9Cnot set=E2=80=9D<br><br><=
/div>Cheers,<br></div>Matti<br></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">2016-04-15 12:57 GMT+03:00 matti kaasinen <span dir=3D"=
ltr">&lt;<a href=3D"mailto:matti.kaasinen@gmail.com" target=3D"_blank">matt=
i.kaasinen@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"ltr"><div><div><div>Hi!<br><br></div>I can&#39;t verify/control Dyn=
amic Voltage and Frequency Scaling on my am335x based board as=C2=A0 /sys/d=
evices/system/cpu/cpu0/cpufreq directory is not created. I already asked th=
is from TI e2e forum and thanks to hint from there I found a problem from k=
ernel configuration options. There is no &quot;Dynamic Frequency Scaling&qu=
ot; option present in:<br></div>menuconfig tree: &quot;System Type&quot; -&=
gt; &quot;TI OMAP Common Features&quot;.<br><br></div><div>I tried this als=
o without my own defconfig loaded with similar results.<br></div><div><br><=
/div>I should have pretty recent meta-ti tree but not necessarily quite up-=
to date. Should it need updated/do I need some kind of patching. Or is this=
 feature just not available in RT kernel?<br><div><div><div><br></div><div>=
Thanks,<br></div><div>Matti<br></div></div></div></div>
</blockquote></div><br></div>

--001a114a7fec99f9d6053087a9d7--
