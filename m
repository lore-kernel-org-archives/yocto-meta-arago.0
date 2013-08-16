Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by arago-project.org (Postfix) with ESMTPS id 03494529A0
	for <meta-arago@arago-project.org>;
	Fri, 16 Aug 2013 02:33:03 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so1349757pab.27
	for <meta-arago@arago-project.org>;
	Thu, 15 Aug 2013 19:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=8gZpNBWWlK4JQ0D/dbWCirVQJmvLVF13EelYYyHoOqQ=;
	b=L97/8ArGwNYcHyGWINq4p1m6xwE5j3MvJ7UyhvnRgOokCy9O8yj2TpJGr6tI4fj1pJ
	SRqCnVch4fzi+0cr6tD/JvOf9N+5/qTDLLKYuvUarsCWfXWjPSgdBA9vh91CAaS7zy8V
	MhluaB3GzXJdCqVWiXCg9GBj+VOl2WTwuuOzRqjkt84PSTIsrLFES7EsdKfGtTTHEJVV
	ulNufnObgBXEF4UUNFy3+ePBT6Hb3nAIcIimCsZg9m/c5sPx7kTGBA6ooH4DjO4Q1Y6e
	cOWqiLTCW7KtLnAbqjFeaEX/cnhxv3MYwhQskiDCEUa1Lkm1lm1blKtO2z3SIpaMa41D
	cjwQ==
X-Received: by 10.68.113.99 with SMTP id ix3mr2594pbb.180.1376620382902;
	Thu, 15 Aug 2013 19:33:02 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225])
	by mx.google.com with ESMTPSA id sp4sm2712102pbc.45.2013.08.15.19.33.00
	for <meta-arago@arago-project.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 19:33:02 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <520D8F5A.4000904@gna.org>
Date: Fri, 16 Aug 2013 14:32:58 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: meta-arago@arago-project.org
Subject: u-boot-ti-staging failed to compile
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
X-List-Received-Date: Fri, 16 Aug 2013 02:33:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

I've started a brand new build today using arago-dylan-config.txt, I got 
a build failure with u-boot-ti-staging, the whole log is on pastebin [1].
In short, I got:
make[2]: *** No rule to make target `include/config_cmd_defaults', 
needed by `spl/arch/arm/cpu/armv7/cache_v7.o'.  Stop.

Path have been stripped down for readability.

$ find sources/meta-{arago,ti} -name '*boot-ti-*'
sources/meta-arago/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend
sources/meta-ti/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
sources/meta-ti/recipes-bsp/u-boot/u-boot-ti.inc

Any thoughts one this one?

Regards,
Chris

[1] http://pastebin.com/HGX8i5Uk

