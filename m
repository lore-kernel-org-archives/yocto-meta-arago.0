Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33b.ess.de.barracuda.com
	(egress-ip33b.ess.de.barracuda.com [18.185.115.237])
	by arago-project.org (Postfix) with ESMTPS id 9CDE452A23
	for <meta-arago@arago-project.org>;
	Thu,  5 Aug 2021 21:04:00 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
	[209.85.216.71]) by
	mx-outbound17-161.eu-central-1b.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 05 Aug 2021 21:04:15 +0000
Received: by mail-pj1-f71.google.com with SMTP id
	o1-20020a17090aac01b029017730151351so1651033pjq.3
	for <meta-arago@arago-project.org>;
	Thu, 05 Aug 2021 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RlOyombyaYG8ob3B4IEkk0kquq02q3n0qchjB28Fv2M=;
	b=ZkVW7vgX/JUv6H9UCeoq0ntRW9+/wTutYg5reuoDM8xzKXw8iO9SkuSv8u0i4GjZKF
	hgTWshgOsLIYehRs1IHi2oj2DrRQkh5xy+aLK7VrAs7TAkim611f5vxaYVsnIEC2jyiJ
	A17B/XWIkH7gMofejIuhZ7O6AVNi/mkFG0a3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RlOyombyaYG8ob3B4IEkk0kquq02q3n0qchjB28Fv2M=;
	b=kpU5yMzWpxT6rEHuZKcfjQjOQnrcoNX0XP3x9IoSIAAYgoV/wyEWbcZOqE0hk8qfHa
	lew/KRd1ULrkMY4DErylcp+I84Pm8fOQZX4bqWKiuSnmOtd/oJ2LuPcceQReeYntUWLN
	t1WBmtweo/zAlQm2GIbRwvBVqD8Jb9LNGNv1uefrr2T+EIUk2vFGOjq5HsdAGJnuDTbR
	P64rAcAfLSZ7+S7mmJrlGK3PLpoYkiUSacoSRJHcCAChiw9GQvkD7RYlzW5eXj0X+JTU
	390tosMfkap3zp3KEbEPmqMoZazF/Pv9Svzxqrg1zvtEQPq7tzfmLh8dfyULVT2NL8/U
	JZ+Q==
X-Gm-Message-State: AOAM530RY8ECpGSREpWO9KXIE2nFzA7lIoIkq4CF0VbC1qhlWgMCAuTV
	HjELQCZje+j1ANcDv3sX0neNH8Nmju6MEgdM6KgEQAhSzG6/2sKd6+xQsdWSLZnAByhjXcUm0sz
	iD0/Cgd9ZwT9tQHP2/vI1xiZ94Bv+bi0BMSz93+6wESTZUz5iUyGZ9JCPIYLS
X-Received: by 2002:a17:90a:d3cc:: with SMTP id
	d12mr6514192pjw.151.1628197452289; 
	Thu, 05 Aug 2021 14:04:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNGlUfqWrrpCKlSCKGSM2mXyZQ7F+ttn0dKiHsIAjaXs/z3R8eJrvxvQE87xQIL11iMGwDKg==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id
	d12mr6514170pjw.151.1628197451876; 
	Thu, 05 Aug 2021 14:04:11 -0700 (PDT)
Received: from LAP000507.mistral.in ([122.179.112.161])
	by smtp.gmail.com with ESMTPSA id a8sm8941938pgd.50.2021.08.05.14.04.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Aug 2021 14:04:11 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  6 Aug 2021 02:33:42 +0530
Message-Id: <20210805210342.63368-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1628197455-304513-5417-72280-1
X-BESS-VER: 2019.1_20210719.2036
X-BESS-Apparent-Source-IP: 209.85.216.71
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233881 [from 
	cloudscan8-113.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [oe-layersetup PATCH] coresdk-07.03.00.005-config: Add missed out meta layers
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
X-List-Received-Date: Thu, 05 Aug 2021 21:04:01 -0000
Content-Transfer-Encoding: 8bit

* Add meta-processor-sdk meta layer required for AM335X, AM437X
* Add meta-aws meta layer required for AM335X, AM437X
* Add meta-linaro meta layer required for AM335X, AM437X
* Update OECORE config file to processor sdk specific config file

Signed-off-by: Priya N S <priya.ns@ti.com>
---

Hi All,
This patch adds the meta layers that were missed out in the
coresdk-07.03.00.005-config file.

Note:
* The Processor SDK build are verified for am335x-evm and am437x-evm
  platforms.

 configs/coresdk/coresdk-07.03.00.005-config.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/coresdk/coresdk-07.03.00.005-config.txt b/configs/coresdk/coresdk-07.03.00.005-config.txt
index 97e540a..afab00e 100644
--- a/configs/coresdk/coresdk-07.03.00.005-config.txt
+++ b/configs/coresdk/coresdk-07.03.00.005-config.txt
@@ -2,13 +2,15 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dunfell,HEAD,layers=meta-optee
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
2.19.1.windows.1


