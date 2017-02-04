Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by arago-project.org (Postfix) with ESMTPS id A52B55209B
	for <meta-arago@arago-project.org>;
	Sat,  4 Feb 2017 21:42:44 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id j82so2169883ybg.2
	for <meta-arago@arago-project.org>;
	Sat, 04 Feb 2017 13:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aQktE6FEH+uPWiRlmL+2BjRrEa4yuL+OlJnPuDYJUJo=;
	b=oA85i39PwG+YYUjd8Uf7278HYJvJRnSgfm7rezjw2jTaQ3ucmqYs1b/7zdUyVgwTaO
	sr9gTBj+21HN8KglMqEtMn5mQ+WEilSmh8W9LGh4fVb8QxSyW9UJlCTNql3IdU8ji/A0
	BH6qHGkkspEclc9vQTCCB8Z45uLOo9tciaMW6l3YQzFexwd3SaG1pCX5vRx/ao9i9nm3
	p1/Ee4otFFAohKGUUOlldhmcYrIwu3hgH0NMN9yem5odVSAOyHv7BElClp8EnDjg9YKW
	WvRpKVJLeu+QK4wFVjJOpptpFznY7NgvPpDQd9GvF6FoeG8765uhujnfaYGpOWLdJKOD
	mLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aQktE6FEH+uPWiRlmL+2BjRrEa4yuL+OlJnPuDYJUJo=;
	b=c+K4/P47D4gn9uzrF1qU3I6uCX6M39Edz84eBwGUoYTLVZPVXWoxsmIyAAQTMllu8V
	oUuCdPDiCh9M/QWKJcX22AQEVcWEr2LuSRHsovpRL3GmRKoqNktb2C0etd3uxLkMWCsr
	tKDCo7sxs3+Kxd21l6PDled1rhcnxtwAJUZaGH5UWmJB6RK+9glyQG8DQZeYO3cm4CsD
	eq7NWF7sVWs9VHJFawb9bfzEZwbOzVtMOnMEkNHVT2Al0es7g1sn18q61Qt93YxhOy1a
	KrJkMxHPkjSFf3mhyYWV54YuCCzlfMxCbJjzqGQvEF7DLrI4OU8WSUY+zL71QTAP4A9e
	ryAA==
X-Gm-Message-State: AMke39kfNhHNoRUkWFHYjdXfl7c93LueyR7BBzCAtyQ8BUCoYyWA0uSdGttP70B2VFyMu+H0QjkaIAVgeyJh2g==
X-Received: by 10.37.177.138 with SMTP id h10mr2391883ybj.9.1486244564543;
	Sat, 04 Feb 2017 13:42:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.129.80.215 with HTTP; Sat, 4 Feb 2017 13:42:24 -0800 (PST)
In-Reply-To: <20170203003337.GA19545@edge>
References: <CADySD0FEFTwomoxgH9hhP97vxkW5aH5EJqh4h1+_thpS5cPsFQ@mail.gmail.com>
	<20170203003337.GA19545@edge>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 5 Feb 2017 10:42:24 +1300
Message-ID: <CADySD0Hr2rmA8Eu6bdngmEMri67Fc7_2JiFhJmQWTYhAb0CO1w@mail.gmail.com>
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
X-List-Received-Date: Sat, 04 Feb 2017 21:42:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi Denys,

I have following dev packages installed in my rootfs which I don't want

- linux-libc-headers-dev
- libgcc-s-dev
- libc6-dev

I haven't explicitly added any -dev package.
How can I remove them ?

Thanks
Ankur

On Fri, Feb 3, 2017 at 1:33 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Fri, Feb 03, 2017 at 01:26:38PM +1300, Ankur Tyagi wrote:
>> Hi,
>>
>> I have an image recipe which include packagegroup-core-boot which
>> brings in external-linaro-toolchain which in turn adds
>> linux-libc-headers.
>>
>> How can I remove linux-libc-headers from my end root FS ?
>
> linux-libc-headers is an empty package. linux-libc-headers-dev is the one that
> contains all the standard headers required for development. Which one you have?
>
> --
> Denys

