Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by arago-project.org (Postfix) with ESMTPS id C342952A1A
	for <meta-arago@arago-project.org>;
	Tue,  9 Aug 2016 13:08:55 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id 52so5116279qtq.3
	for <meta-arago@arago-project.org>;
	Tue, 09 Aug 2016 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=HzmVKnAMdoQr8w0zqW6HIDAStVS6ZbOYH4aJuAazbT0=;
	b=wJ/dGQmYqMQ6RCkBzXKUnOJZf1pFzmjlQnRhYqFHONyzb0V55F7pXiduAhf2011nsQ
	lUdA33Zsg/HsCr6O1l+63se7LgSln/iMN7ngIrgOHHFQXODkuW2kVfyv2+sGlwFCWuGl
	CHCo2TmheiFgQdLQVpDBuZUnh2MXktjSZ19N5SodLDsTQHqC9Ft3V3nvp9MaPxo+WHjt
	uq4U0p1tlUjsEx6R757b/SbwDn0xrtFjh17buYd2vu7R0P7QCyZoOaBxeHlZyEnXJETa
	kPNx84LAp6enVpi3+TBlLa1x6Zefje8NZBCevSwxut4ygY2rYbIAFjRyZWUeiegDfSDr
	LOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HzmVKnAMdoQr8w0zqW6HIDAStVS6ZbOYH4aJuAazbT0=;
	b=fq2Vd4YBeAcB6uL+kvq641UbdniYLRdUELIqyqQXCsmvt6XmP9A9uXeYXTH5mTi/ic
	3QW2MB7kSrx6WhqhXdyjsp0+h5Ki1FMPZQbRTqSV4XxNe1ZINbbyLtLC0LZwlxYze53A
	kok0OEdO35PxKu51yOrGFf0IPqVVcDZcPxsH7ZayFijw46zdCPXGGYzsqvTxR1UidO5f
	Y6r37+F6YMBzo2gxGbzavo3uxgDLfOocBupt2dpt0LQviCBJxUcLLx5nCxwLxY4tQwq5
	cvg6sAmanN7HGIo8pL1n0zDyptrtcEccUf5BiSa++kZZz714sPZwHZxg1c0nDtr2PcA0
	SFtw==
X-Gm-Message-State: AEkoouvvz1lb5XtCLZ5tVjDBCyl2SFZDCxY51MtngHUIZb9Wz8G3EWhy/iTNwXytnWHiEkeUN1VkXJE5qn4tVQ==
X-Received: by 10.237.41.225 with SMTP id o88mr35078893qtd.18.1470748135636;
	Tue, 09 Aug 2016 06:08:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.198 with HTTP; Tue, 9 Aug 2016 06:08:55 -0700 (PDT)
Received: by 10.200.47.198 with HTTP; Tue, 9 Aug 2016 06:08:55 -0700 (PDT)
In-Reply-To: <CADySD0FeO9P+H0ueUwz4XYQcWDO8Bi8oQ1UC-=iA4=L1Kar0Mg@mail.gmail.com>
References: <CADySD0E6EM9Ahia5FYPrd7BSC8Xp4Oz4f7GxC4qzq_923jZ23A@mail.gmail.com>
	<CADySD0E9tLqd7Ki3x8qUxmEdEU1Fr0k86jHswPnfeWtP1xvTEw@mail.gmail.com>
	<CADySD0FeO9P+H0ueUwz4XYQcWDO8Bi8oQ1UC-=iA4=L1Kar0Mg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 10 Aug 2016 01:08:55 +1200
Message-ID: <CADySD0Fn8KjtvFtt9+UpuCNk0PK4SmfWhtPsin-5KucG=_9+qQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Psplash screen disappeares when login prompt comes
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
X-List-Received-Date: Tue, 09 Aug 2016 13:08:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c12542a2dc6bd0539a33cf9

--94eb2c12542a2dc6bd0539a33cf9
Content-Type: text/plain; charset=UTF-8

Hi,

I have created a custom splash screen using psplash for am335x evm based
device having touchscreen.

Splash screen is displayed during boot process but when login prompt comes,
my screen goes blank.

My question is how can I make splash screen visible until my application
starts ?

I have modified my /etc/inittab to disable getty on virtual terminal
(touchscreen), getty is only enabled for serial console.

I searched TI forum for some pointers but I am not making any progress

Thanks
Ankur

--94eb2c12542a2dc6bd0539a33cf9
Content-Type: text/html; charset=UTF-8

<p dir="ltr">Hi,</p>
<p dir="ltr">I have created a custom splash screen using psplash for am335x evm based device having touchscreen.</p>
<p dir="ltr">Splash screen is displayed during boot process but when login prompt comes, my screen goes blank.</p>
<p dir="ltr">My question is how can I make splash screen visible until my application starts ?</p>
<p dir="ltr">I have modified my /etc/inittab to disable getty on virtual terminal (touchscreen), getty is only enabled for serial console.</p>
<p dir="ltr">I searched TI forum for some pointers but I am not making any progress </p>
<p dir="ltr">Thanks<br>
<font color="#888888">Ankur</font></p>

--94eb2c12542a2dc6bd0539a33cf9--
