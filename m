Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by arago-project.org (Postfix) with ESMTPS id 508AC529E1
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 13:16:35 +0000 (UTC)
Received: by lalv9 with SMTP id v9so25890599lal.0
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 06:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=BOabGuykBB+CZacjycQMOH6nURROxQ6vxG/2R8idB4s=;
	b=gAxiPkfm2ECfYELQOK2X07Ujob3HIAo1Q9wWuYTSPplBbR6KGarA1/Q6I5sSNPIe0C
	DZonbd/GzoHqj4cXJOzMYpj8R4En2uIQtZCyLDQE62fRikiqSDVYWZvvtrEZ16sfzgvh
	psazufA/dtx3fYkyKF5YBuAqOgvuCKa1VrPA5dIaQQ/Xvba2ghtZ8x8G5f/JkG0Li9xx
	cJ4jR5Tzo+Dzhy4ziw4BhDMcMw0K+9IiVetg0YZhSnK3SjYnuL24G6xx0BZaNGnb9jI+
	tq9eO03ot3oo/EjX7w4aS6kpyL9f9WKJ+HGYitxrYxtBydRdQ+Kw0ZJMIX496Gc5oiRz
	+XaA==
X-Gm-Message-State: ALoCoQncutjIrDGACyqTAWVv59c5aL89OcVcKE7CnOAvfdDk1axBzCs8rCD760ergj0k3/twdDE6
X-Received: by 10.152.5.65 with SMTP id q1mr33636009laq.83.1439471793337;
	Thu, 13 Aug 2015 06:16:33 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id i7sm553092lag.9.2015.08.13.06.16.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 06:16:32 -0700 (PDT)
Date: Thu, 13 Aug 2015 15:16:30 +0200
From: Anders Darander <anders@chargestorm.se>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20150813131630.GG15357@ad.chargestorm.se>
Mail-Followup-To: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	meta-arago@arago-project.org
References: <CADySD0Fs0k-B0G=ZFa_yesxdF7tuvdjjAkfKdBPp0JpS=5EcVw@mail.gmail.com>
	<20150813093331.GD15357@ad.chargestorm.se>
	<CADySD0EM1OaWLjZPBczm0EqFP0BzM6oOaX_AEpTgS3s7g+gufg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0EM1OaWLjZPBczm0EqFP0BzM6oOaX_AEpTgS3s7g+gufg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: meta-arago@arago-project.org
Subject: Re: Using Valgrind from Yocto doesn't give stack trace
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
X-List-Received-Date: Thu, 13 Aug 2015 13:16:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Please don't top-post on those mailing lists!

* Ankur Tyagi <ankur.tyagi85@gmail.com> [150813 12:41]:
> How to include that package with debug symbols ?

If I remember, the package with all debug symbols is valgrind-dbg (i.e.
I don't think valgrind renames that package).

So if you've got plenty of space, you could always install that one.
Otherwise, you'll have to decide upon whether to only copy that single
file manually, or create a separate package with that file in.

It's completely up to you.

Cheers,
Anders


> On 13-Aug-2015 9:33 pm, "Anders Darander" <anders@chargestorm.se> wrote:
> > To get better backtraces than this (which is useless), all you need to
> > do is to install the debug symbols for vgpreload_memcheck-arm-linux.so.

> > As the complete valgrind-dbg package in Yocto is far too big, I just
> > created a new package with the debug symbols for
> > vgpreload_memcheck-arm-linux.so.  After installing this to our image (or
> > just manually copying the debug info for that file into the rootfs), the
> > memcheck tool from valgrind will start giving you usefull backtraces and
> > thus, a usefull grouping of memory leaks.

-- 
Anders Darander
ChargeStorm AB / eStorm AB

