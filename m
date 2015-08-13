Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by arago-project.org (Postfix) with ESMTPS id E30B1529E1
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 09:33:36 +0000 (UTC)
Received: by lalv9 with SMTP id v9so22948845lal.0
	for <meta-arago@arago-project.org>;
	Thu, 13 Aug 2015 02:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=CSrMZ8uF3DvWwoleJrz2wc5shjTtG4FLpvmeXVPryN4=;
	b=iTBjZU3E+R9zrp98wTe2z+KadLQKmruJj3+SN91i6jUWpHS4gToicteDjVxCxyijZp
	hW123z3XM1QAE8jozfRTOh9OzBxQ2GSAWNo1xGOKzb7hxz+sO44jJ4Kcgwn8wpXXPpXc
	xHS2fhojnVtBpu0B52Pmyj0eP0ruxymdOKLrxDH7wjQzJ+4OXAhU9r40DbxGEAAYfmoX
	Pq34koWTeweqljteZYxrV0MOLywhSejlnhjedYsb0dkIsKqahtLNRykd585W3OJ0a7l9
	3q6vzCXpeYGQg3acc5F84aXn5zg7Jp8jZ9fJSxUOMUfp2jL/JwbElCVYOW3ecicjcAeO
	QPPQ==
X-Gm-Message-State: ALoCoQmhl376J6Mlmf3loJEjBIM/4Xq4aqXErSRX9TldoHlHWMUVBHvFLf0CqLvWxys4J5X50bSI
X-Received: by 10.152.8.233 with SMTP id u9mr13812299laa.8.1439458414333;
	Thu, 13 Aug 2015 02:33:34 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id 6sm401391lai.27.2015.08.13.02.33.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 02:33:33 -0700 (PDT)
Date: Thu, 13 Aug 2015 11:33:31 +0200
From: Anders Darander <anders@chargestorm.se>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20150813093331.GD15357@ad.chargestorm.se>
Mail-Followup-To: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	meta-arago@arago-project.org
References: <CADySD0Fs0k-B0G=ZFa_yesxdF7tuvdjjAkfKdBPp0JpS=5EcVw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0Fs0k-B0G=ZFa_yesxdF7tuvdjjAkfKdBPp0JpS=5EcVw@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Aug 2015 09:33:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* Ankur Tyagi <ankur.tyagi85@gmail.com> [150813 06:25]:
> I am using Valgrind coming from yocto on my AM335x-EVM kit.

> But when I try to use valgrind, it doesn't give me stack trace. Following
> is what I get :

I actually got the same question from a customer (on an older TI arm
core) earlier this summer. So luckily I rember what the fix was...

> ==1732== HEAP SUMMARY:
> ==1732==     in use at exit: 4 bytes in 1 blocks
> ==1732==   total heap usage: 2 allocs, 1 frees, 8 bytes allocated
> ==1732==
> ==1732== 4 bytes in 1 blocks are definitely lost in loss record 1 of 1
> ==1732==    at 0x4811FE8: malloc (in
> /usr/lib/valgrind/vgpreload_memcheck-arm-linux.so)

To get better backtraces than this (which is useless), all you need to
do is to install the debug symbols for vgpreload_memcheck-arm-linux.so.

As the complete valgrind-dbg package in Yocto is far too big, I just
created a new package with the debug symbols for
vgpreload_memcheck-arm-linux.so.  After installing this to our image (or
just manually copying the debug info for that file into the rootfs), the
memcheck tool from valgrind will start giving you usefull backtraces and
thus, a usefull grouping of memory leaks.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

