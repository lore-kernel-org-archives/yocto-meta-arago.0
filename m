Return-Path: <pthomas8589@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by arago-project.org (Postfix) with ESMTPS id 2F4CF52983
	for <meta-arago@arago-project.org>;
	Tue,  5 Jul 2016 00:39:24 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id e3so74929380qkd.0
	for <meta-arago@arago-project.org>;
	Mon, 04 Jul 2016 17:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=uPcbVyXEkmuurHjEMqbbLqzIQw2MwIC1PXpmSftN4os=;
	b=EhP5ozAJH0MU5WkRNeJsW/NW7NhPHm4vJLVFFEextN/y/Rs7ZpdyT67Q6INRAr9EST
	rYl3CY1coII3Rr/7aebm6E7DQkLq+2uM2bW3d2cY9ppB7G5XfH3Ruj7ZgaKESwbH+5b0
	pdfkV+fnEKc23TIoyxPkiaOXXiU8kTzZHZx2F2Xwhwyy3/2ppQlTjfisbxXFuCrDaoRH
	KNAoxTNmCa1/782zuEge0DfK6cQhnc6u050Xqx7buQHfEnuyFlat2wyaZhRBsuou8AKI
	Dv4eO2ESf5gGCLY3UL5iXXZvngzRJVabP+BNZLAlr1f+lEm8AdjQzMH9iFPMMKhJyf2s
	5vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=uPcbVyXEkmuurHjEMqbbLqzIQw2MwIC1PXpmSftN4os=;
	b=douOIzb2wHe7N2hLImSjJK+U/8YXqSKUI6bBmI8+RMbjlag8p7avScZMOx4MabG++I
	lx30EVGWUInfapsuVEkoDJotKhdL1VuiGURHZy8mnLSHvVVC4cRTmUZ85XXik7LMyOwH
	kRMFMBzcMO5iH+fTG4Smv04JLbxVyEiZWWAElZuNHsKqOr8JUKBbk9w4aTTAY27n2IC/
	G7jf/Tzo1eR80rLVbcdAbYt8Z4/73U5XezTPdT9qFibELVj45hraG0irDB5/29jNmlaz
	9kqJMAhwAv9vczQZ9UdLp9puvvsrBDaiyeMr+8eTTeCovX5jeRT6kpZ08WwseVEOe0Dn
	kBlw==
X-Gm-Message-State: ALyK8tJh/Ucq2vG8gDpyCEtnKxx2jItbDBRNiSGJYLQUjb1bZWrd2BpVurYmjSa9RwanLARt/X1FNtIQWRN/jQ==
X-Received: by 10.55.178.195 with SMTP id b186mr17916574qkf.81.1467679164079; 
	Mon, 04 Jul 2016 17:39:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.17.141 with HTTP; Mon, 4 Jul 2016 17:39:23 -0700 (PDT)
From: Paul Thomas <pthomas8589@gmail.com>
Date: Mon, 4 Jul 2016 20:39:23 -0400
Message-ID: <CAD56B7dPn1yNtVe+oDi=m3yUdoVa6+xpggAeUjRk356AkP4rSA@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: arago arm9
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
X-List-Received-Date: Tue, 05 Jul 2016 00:39:24 -0000
Content-Type: text/plain; charset=UTF-8

Hi I'm trying to build an arago root file system for the L138 but
following the instructions on the wiki page:
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

For daisy for MACHINE=am180x-evm with a few small changes (compiler
md5 & changing to linux-dummy) this worked, but udev was broken saying
"udevd[588]: unable to receive ctrl connection: Function not
implemented" looking other places this appears to be an issue with
accept4, arm-arago-linux-gnueabi-gcc doesn't even compile a test
program with the system call. (BTW, the system is runnable and usable,
but logging is flodded with the udev messages)

Anyway my thought was to then try dora, but this also seems broken
when trying to build kmod with lines like "kmod.c:73: undefined
reference to `_Static_assert'"

Is there any sort of build matix for the current build status? I think
it would be very helpful to include that on the wiki page
(http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment).
I can provide further info for either the kmod or udev issues.

Just for completeness, krogoth & fido say:
ERROR: ParseError at
/home/bulk/amsc/arago/tisdk_krogoth/sources/meta-arago/meta-arago-distro/conf/distro/arago.conf:83:
Could not include required file
conf/distro/include/toolchain-arago.inc

thanks,
Paul

