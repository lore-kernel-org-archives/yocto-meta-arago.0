Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by arago-project.org (Postfix) with ESMTPS id A4EBF52B25
	for <meta-arago@arago-project.org>;
	Tue,  7 Feb 2017 04:27:16 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id j82so31833470ybg.1
	for <meta-arago@arago-project.org>;
	Mon, 06 Feb 2017 20:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g5yy7GnSkYuwn5BD4nLZvqkByMgyi4Vo/2soS/cXDvM=;
	b=dgpFPAimDXSx1yjOhhFYgd78W6xTxG+3LDr5aSottiBDoc0QHA+LoLI5wXU+Z7zeeW
	W58noKcwk/YS2i/qfbe9maUyvstqduyupRYDLczpQNti9+pDM9Z7HoyB6qZxt1ePtinL
	sQSDT2w678t5DfVaxH/N2jLk/UAoq6eGnMd3Gd/czRrU9zS8KavFYPKf9FMVK/kHM6eN
	+84+/5PPyT3SnqPDc5iaL+JrXxOVa5eHxT97fGVPL3QDUNIXL0m6pR2IjNS4ETXynnRg
	oxoPQLjy1pnutbu0w6tSNuILeWnc8cedun/QamLbBAMkwgtsQihJuty6GfF3oZQ0lvKh
	ag+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g5yy7GnSkYuwn5BD4nLZvqkByMgyi4Vo/2soS/cXDvM=;
	b=gav8nsoUurlu9xjxvO7hb+yozp1zeMITSCMYRdO3c/VoOOgQn9VxomE+JeveP8RelU
	w+ksttWDa+atryA9PmVgJNCt30mvm+xkkn5AhhzI3rnd8lTn+aHs4PeGvSWHIyzJOhOq
	oCXb6hb/mAIBLbqPTmNfn25UYk1mMIsXM5lUIzDz9MJXmiiUVdP67Ntcw58pg6MPHJt+
	aChcNCxJrwMqKxtSCy1kUuwm3YD2jMB5G02EiX+uYpsjTG5g7b4kgvmiS22hpJK7LUCt
	nRsVgXGIJ33HYlL1UUVzPqwTKKQfq62D2bn2iwX7EbVQw8FT9/ers/xN4UAnSHRYUbZa
	Kdhw==
X-Gm-Message-State: AMke39n7hoQIuCHLJK981fDpy6H8AIaFa632FNYx0s0vkjUIM6gNNzJ5VSlb/tJdqj6H7bEeFOQ/U2yprTnGUA==
X-Received: by 10.37.54.13 with SMTP id d13mr9686464yba.81.1486441636625; Mon,
	06 Feb 2017 20:27:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.80.215 with HTTP; Mon, 6 Feb 2017 20:26:56 -0800 (PST)
In-Reply-To: <CADySD0Ht7tH=QC6C6r2f-PgTX1P192x5o0jry8yo-Fe6OVk3mQ@mail.gmail.com>
References: <CADySD0FEFTwomoxgH9hhP97vxkW5aH5EJqh4h1+_thpS5cPsFQ@mail.gmail.com>
	<20170203003337.GA19545@edge>
	<CADySD0Hr2rmA8Eu6bdngmEMri67Fc7_2JiFhJmQWTYhAb0CO1w@mail.gmail.com>
	<CADySD0Ht7tH=QC6C6r2f-PgTX1P192x5o0jry8yo-Fe6OVk3mQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 7 Feb 2017 17:26:56 +1300
Message-ID: <CADySD0Huh=wkgE8wNtp0b3Hv5_2c9D3ZYvmx9=UWK6A8zJpLpA@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 Feb 2017 04:27:17 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Any suggestions on how to remove these packages from my rootfs ?

I know daisy is old but my current sdk is based upon it. I am in
process of evaluating morty but it will take time.
Until then, I would like to tune my current rootfs.

thanks
Ankur

On Sun, Feb 5, 2017 at 11:02 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> To add more, linux-libc-headers  indeed produce linux-libc-headers-dev
>
> bitbake -e linux-libc-headers | grep "^PACKAGES="
> PACKAGES="linux-libc-headers-dbg linux-libc-headers-staticdev
> linux-libc-headers-dev linux-libc-headers-doc
> linux-libc-headers-locale  linux-libc-headers"
>
> And forgot to mention that I am using *daisy* branch..
>
> On Sun, Feb 5, 2017 at 10:42 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
>> Hi Denys,
>>
>> I have following dev packages installed in my rootfs which I don't want
>>
>> - linux-libc-headers-dev
>> - libgcc-s-dev
>> - libc6-dev
>>
>> I haven't explicitly added any -dev package.
>> How can I remove them ?
>>
>> Thanks
>> Ankur
>>
>> On Fri, Feb 3, 2017 at 1:33 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>>> On Fri, Feb 03, 2017 at 01:26:38PM +1300, Ankur Tyagi wrote:
>>>> Hi,
>>>>
>>>> I have an image recipe which include packagegroup-core-boot which
>>>> brings in external-linaro-toolchain which in turn adds
>>>> linux-libc-headers.
>>>>
>>>> How can I remove linux-libc-headers from my end root FS ?
>>>
>>> linux-libc-headers is an empty package. linux-libc-headers-dev is the one that
>>> contains all the standard headers required for development. Which one you have?
>>>
>>> --
>>> Denys

