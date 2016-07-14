Return-Path: <pthomas8589@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by arago-project.org (Postfix) with ESMTPS id 36B9252A96
	for <meta-arago@arago-project.org>;
	Thu, 14 Jul 2016 20:02:44 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id o67so82919488qke.1
	for <meta-arago@arago-project.org>;
	Thu, 14 Jul 2016 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=McS3EhtNNL2g6VPxiC4OgFNyvv1uYIE3SQw6e8AO5dU=;
	b=DXdi2rl6K+yLv9pIn83LdG+g76OjxjwGxY5Cuji1iLOFD2cWJs559ZkFnZWHngyxKM
	RHCUfvC/h3eXM003M/bVwP9RZj1JOmM4xjO6xNlCpZloh0RjDFI5RWHL4rySSC4lgKw1
	6SlT+3fT1LYX9KahNtj9eiDQylOkVAkaHmywMDZ6cE2TDphhAl9maOB7X8SaC1MCg4Bg
	PsPfELGN5+4EJNCFZbonzAc4KkP5WAJCwGwsund+LxeeG0ET9lATc3wm4A7tIO9B2q1a
	56+j5TjzHEkHGc+KqFDSUsvv9RmDrq97peWeBpVUXsIqHwbWCu+wgCqRPC93EbDvUZiP
	xLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=McS3EhtNNL2g6VPxiC4OgFNyvv1uYIE3SQw6e8AO5dU=;
	b=If3NVw6lNiE+xbpHN9M8LxybptkRx2YFB3XW+bVx/KDV+OYGuNvRLAF3ulRoHYDUrp
	hMseKVtyAp+s8huI4XbAd7SjquYnR2JEl1EIAJEwfkmJ0BAG9Ko9pqBQlVo/hJyhpgvS
	yf8Dml9BGOZ/BRrVpouiADRI8rT4x4g6WsjPvWs2NHjrxH/0Lf6MT5ex/5YE78ieigxe
	PwqgkcpV1dU+G8x8Ul8Lm+5Do+6mCyc2WZfbQIC8jT+BMOeSc4rp6dnhk4n9Cxs4LRzP
	wGv9GMU+vJQpjvQaW1+y9w7AOt+sAyKMb2GIKZ4Hq1PNQ7lPgq3zX97pbQODn9W4moRv
	UpsQ==
X-Gm-Message-State: ALyK8tKyS/EbTGhCtqLfcCp5Z1/8ncLptRwIc+UCKUuhYqD4cWziebYfnLv4J11eS/mMIieZ4s7+kfrtD6L5Xg==
X-Received: by 10.55.178.195 with SMTP id b186mr18618306qkf.81.1468526564333; 
	Thu, 14 Jul 2016 13:02:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.17.141 with HTTP; Thu, 14 Jul 2016 13:02:43 -0700 (PDT)
In-Reply-To: <20160714175143.GA3473@edge>
References: <CAD56B7dPn1yNtVe+oDi=m3yUdoVa6+xpggAeUjRk356AkP4rSA@mail.gmail.com>
	<20160714175143.GA3473@edge>
From: Paul Thomas <pthomas8589@gmail.com>
Date: Thu, 14 Jul 2016 16:02:43 -0400
Message-ID: <CAD56B7cpAieyATeP1ZNoYOARQ_ZF5a2X12J2EV__-Nqe=QYfHg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: arago arm9
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
X-List-Received-Date: Thu, 14 Jul 2016 20:02:44 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Denys,

I am having some luck with yocto poky.

One of the more confusing things to me was to get the openembedded
stuff I had to do the coresponding git checkout, and then add in the
layers to bblayers.conf, like so:
  /home/share/yocto/poky/meta-openembedded/meta-oe \
  /home/share/yocto/poky/meta-openembedded/meta-python \
  /home/share/yocto/poky/meta-openembedded/meta-networking \

I guess that's really a yocto/openembedded note no Arago.

thanks,
Paul

On Thu, Jul 14, 2016 at 1:51 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> Hi,
>
> ARM9 platforms haven't been part of our builds and releases for quite some
> time - probably since daisy or maybe even before. So, some parts started to
> rot (first 2 issues you mentioned) and since the custom Arago toolchain used
> for those is about 5 years old, I started removing support for it from latest
> meta-arago (the last parsing issue).
>
> The platforms themselves are still part of meta-ti and mainline kernel, so
> they can still be built with a more generic OE distroless or maybe even Poky
> distro, but Arago support has been deprecated for now...
>
> --
> Denys
>
>
> On Mon, Jul 04, 2016 at 08:39:23PM -0400, Paul Thomas wrote:
>> Hi I'm trying to build an arago root file system for the L138 but
>> following the instructions on the wiki page:
>> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
>>
>> For daisy for MACHINE=am180x-evm with a few small changes (compiler
>> md5 & changing to linux-dummy) this worked, but udev was broken saying
>> "udevd[588]: unable to receive ctrl connection: Function not
>> implemented" looking other places this appears to be an issue with
>> accept4, arm-arago-linux-gnueabi-gcc doesn't even compile a test
>> program with the system call. (BTW, the system is runnable and usable,
>> but logging is flodded with the udev messages)
>>
>> Anyway my thought was to then try dora, but this also seems broken
>> when trying to build kmod with lines like "kmod.c:73: undefined
>> reference to `_Static_assert'"
>>
>> Is there any sort of build matix for the current build status? I think
>> it would be very helpful to include that on the wiki page
>> (http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment).
>> I can provide further info for either the kmod or udev issues.
>>
>> Just for completeness, krogoth & fido say:
>> ERROR: ParseError at
>> /home/bulk/amsc/arago/tisdk_krogoth/sources/meta-arago/meta-arago-distro/conf/distro/arago.conf:83:
>> Could not include required file
>> conf/distro/include/toolchain-arago.inc
>>
>> thanks,
>> Paul
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

