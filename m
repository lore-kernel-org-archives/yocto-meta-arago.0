Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by arago-project.org (Postfix) with ESMTPS id A9D5152B02
	for <meta-arago@arago-project.org>;
	Sat,  4 Feb 2017 22:02:53 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v73so4471702ywg.1
	for <meta-arago@arago-project.org>;
	Sat, 04 Feb 2017 14:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hZ3glaTk48W8z5objOkcNNEYk9lGT4ZYs3VLZekfjwA=;
	b=RyjXcx9MJoCYthFVdCXYtMC5xoq2loPbC8a86AI6/3G4TJXwW02WXZ5Eaj7uqTaAmg
	iNa8pTPxincSLR+M4/Got6TCTCY923oeXTlSz0Z7lYECvDIoPxbFhpTpiZWQeqgaLcM5
	VTSfpyvE8xRx3/tOqwll8SBK7x/JtvVv9ef3cgxJXMltw1z91rXng3ge/O9pv1PPfOEQ
	iS+kZZGGEOZvy53odl0xARGpMtgnPBxousUESByVDPqGsF/bEqcyQdTsgnhL+pURuBR2
	bMarf7/lmcvJYa0p0TgvOqqYxkR7Btrtv2SYv9zM83x1e48qauQezWNQ3PowVoZ1T+PR
	2hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hZ3glaTk48W8z5objOkcNNEYk9lGT4ZYs3VLZekfjwA=;
	b=ZfgADz4SV1yPdXoPzWHwnJVnhlUgzhtLTiKjunORWQSJphIywoAINZ0aj5laESxSgl
	FaPQwQXdnFmsRWZR0tsjdpYpw88lob3i3MVcWzf9NPMLX+5P4dyKnRFQHacbJQzSfvAV
	bZlS/uQEyFyDDWPROkikZaO8UnH7iz8cNsoPMhhqq0n6IKyAybHJ1mC0fEDwtWYgAfG1
	4F4rgBUHd+PzDUTlgJKWJX6GAfe6BQOcd2XxfWK4kd4ZZ1oMi9rLsy+cnGfXluoUKUVJ
	J4vvqM2asSiDYQ6Po/CA8HAmHXvY5nmhUwiKKXpOfBoAiNUZ45qivucLWR67UbYsGPCc
	mOew==
X-Gm-Message-State: AIkVDXKdyiwGk/7Kw/wkiSDuUolsfRsje6gOUMj07w/dCCavp/USVs423O+731tevKP8jmQh1V7No+all99xEA==
X-Received: by 10.129.116.136 with SMTP id p130mr2595990ywc.151.1486245773729; 
	Sat, 04 Feb 2017 14:02:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.80.215 with HTTP; Sat, 4 Feb 2017 14:02:33 -0800 (PST)
In-Reply-To: <CADySD0Hr2rmA8Eu6bdngmEMri67Fc7_2JiFhJmQWTYhAb0CO1w@mail.gmail.com>
References: <CADySD0FEFTwomoxgH9hhP97vxkW5aH5EJqh4h1+_thpS5cPsFQ@mail.gmail.com>
	<20170203003337.GA19545@edge>
	<CADySD0Hr2rmA8Eu6bdngmEMri67Fc7_2JiFhJmQWTYhAb0CO1w@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 5 Feb 2017 11:02:33 +1300
Message-ID: <CADySD0Ht7tH=QC6C6r2f-PgTX1P192x5o0jry8yo-Fe6OVk3mQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: How to remove linux headers from rootfs
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
X-List-Received-Date: Sat, 04 Feb 2017 22:02:53 -0000
Content-Type: text/plain; charset=UTF-8

To add more, linux-libc-headers  indeed produce linux-libc-headers-dev

bitbake -e linux-libc-headers | grep "^PACKAGES="
PACKAGES="linux-libc-headers-dbg linux-libc-headers-staticdev
linux-libc-headers-dev linux-libc-headers-doc
linux-libc-headers-locale  linux-libc-headers"

And forgot to mention that I am using *daisy* branch..

On Sun, Feb 5, 2017 at 10:42 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> Hi Denys,
>
> I have following dev packages installed in my rootfs which I don't want
>
> - linux-libc-headers-dev
> - libgcc-s-dev
> - libc6-dev
>
> I haven't explicitly added any -dev package.
> How can I remove them ?
>
> Thanks
> Ankur
>
> On Fri, Feb 3, 2017 at 1:33 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>> On Fri, Feb 03, 2017 at 01:26:38PM +1300, Ankur Tyagi wrote:
>>> Hi,
>>>
>>> I have an image recipe which include packagegroup-core-boot which
>>> brings in external-linaro-toolchain which in turn adds
>>> linux-libc-headers.
>>>
>>> How can I remove linux-libc-headers from my end root FS ?
>>
>> linux-libc-headers is an empty package. linux-libc-headers-dev is the one that
>> contains all the standard headers required for development. Which one you have?
>>
>> --
>> Denys

