Return-Path: <chgans@googlemail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by arago-project.org (Postfix) with ESMTPS id E3A395299C
	for <meta-arago@arago-project.org>;
	Mon, 15 Jul 2013 05:21:28 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so10765554pbc.7
	for <meta-arago@arago-project.org>;
	Sun, 14 Jul 2013 22:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=wXzBzi6DnXnlWHo4EgD8FSTZzzoMmtQPlWUvkSbB/EA=;
	b=zfafw9eyitCS3DJ+qbpNbJp+w5Chtp6XxeF+r8hc/b3IYh7Oz9bX8XQk8Ap1Cm15/3
	Dm5wP6tw4vmqX+tH+WaYy2pSviHxBD63JK67ob3TgAaO6ezkoCxRaYfSf64jdpPJ7NN7
	tLzrChfVJuDd61kMAHRBKEziMOIa+Pq2VqF2IRai5hLBKc9xl1QqLy6cuzpybVdwNHWL
	N3UOeMInq3vv3C6Slniy/NZTv8DPWmu/iLcwczhO78sgc1QYaEFbZ9IoYks1l1ST03Xa
	Rl4AkEMVncHpLRJnuX9LvzGZKKavnfYG995pBxsiR8wPf6w4SzEt2pRXTz+vulNjV920
	VFZw==
X-Received: by 10.68.176.132 with SMTP id ci4mr19114077pbc.7.1373865687078;
	Sun, 14 Jul 2013 22:21:27 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225]) by mx.google.com with ESMTPSA id
	at1sm58736239pbc.10.2013.07.14.22.21.24
	for <meta-arago@arago-project.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Jul 2013 22:21:26 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51E386CF.9030704@gna.org>
Date: Mon, 15 Jul 2013 17:21:19 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-arago@arago-project.org
Subject: [arago/yocto-1.3] crda and python-m2crypto
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
X-List-Received-Date: Mon, 15 Jul 2013 05:21:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

While building an image with arago-stable/yocto-1.3, I encountered an error:
DEBUG: Executing shell function do_compile
NOTE: make -j 8 MAKEFLAGS= all_noverify
   GEN  keys-gcrypt.c
   CC   crda.o
   CC   intersect.o
   Trusted pubkeys: pubkeys/linville.key.pub.pem
   CC   print-regdom.o
   CC   regdbdump.o
ERROR: Failed to import the "M2Crypto" module: No module named M2Crypto
Please install the "M2Crypto" Python module.
On Debian GNU/Linux the package is called "python-m2crypto".
make: *** [keys-gcrypt.c] Error 1
make: *** Waiting for unfinished jobs....
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see 
/home/christiaga/projects/yocto/arago/build/arago-tmp-external-linaro-toolchain/work\
/armv7ahf-vfp-neon-oe-linux-gnueabi/crda-1.1.1-r0/temp/log.do_compile.15753 
for further information)

Basically crda doesn't build because it needs python-m2crypto, i've 
installed it via apt-get and everything was fine then.
This is not documented in [1], [2] nor in [3].

After digging a bit I found that the CRDA recipe comes from 
arago-distro-extras, but it can be found in 
meta-openembedded/meta-networking (on master, not on danny branch) as 
well. Looking at [4], it seems this version would have this dependency 
built by bitbake (python-m2crypto-native), again python-m2crypto-native 
is available only on master, not on danny.

Do you want me to open a bug report somewhere?

Regards,
Chris

[1] 
http://www.yoctoproject.org/docs/1.1/yocto-project-qs/yocto-project-qs.html
[2] 
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment#Host_tools
[3] http://www.openembedded.org/wiki/Getting_started
[4]

