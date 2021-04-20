Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 0ADC052C98
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 04:03:42 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
	[209.85.214.197]) by
	mx-outbound8-225.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 20 Apr 2021 04:04:07 +0000
Received: by mail-pl1-f197.google.com with SMTP id
	5-20020a170902e9c5b02900eac913a9adso14867288plk.23
	for <meta-arago@arago-project.org>;
	Mon, 19 Apr 2021 21:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qtIrjN7Gg9uyo1GVaNzrmeU6ctRh4GywwfklB5OFcJY=;
	b=lWp7dJVAV58awpTDcLXZZ6SNuwXRHerH04h6m4EVzPpf6xWhJwZqlUxDf1kIMuDhWw
	7PaMPiF6XUtXfDeau628NTX966WqgBqSG7Qfk6pldXaFtqR9uHtWU9tI3XCV52zDyb/s
	X43XiKhW279TstQitJ+D0ie66TEMWbrHjGUgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qtIrjN7Gg9uyo1GVaNzrmeU6ctRh4GywwfklB5OFcJY=;
	b=fRnrgND2tj8vPPnYB7QzUXZUw7qh9Pa856nF6CXcNanrAgBv6BLsTezr5+yQX7ZykK
	eMC2RB0Vxbuc2RwvNpYHrsa3Ffk0pOF3FVLbsJiFuYWaYZmJPRu82yHfobRlTgD9AmBw
	wp4i1IVhZZYQ+7S9Uwf6fAaHhWvE9vPJ91LPwMyW7Cysf2wG40sXL/hVanV7IdikMJR7
	fKPk2mL0vyhaEQ7hIhDPCknUiIT682R9Ghc0ufRqVSsPSOzSOzYh3fQ8f+zzigB5uHrG
	5/XcgriSeLLN1NaxqlIXATzSYvp7eFT1BYVHiogOCDC0lIEjLZ6/VhswIpQSpv5iUyQx
	ErGw==
X-Gm-Message-State: AOAM532UfkrIE+Je9jeIjVJFsf4FlroGUiIz3fTuQWXVVmgRMlPKIjZX
	Qi86OcfSvRnESAKV5m0yVlGHfZiYHO7cbZHvsz3wGVMbv0xyEVPr+4aZnJiygc8AKy9IK6VJQPu
	417I4DyVNa17WIShm3M7mcCSIyBLJMqRLgXENy/ePpDQKjeLORBBr2c4Fgism
X-Received: by 2002:a05:6a00:854:b029:25c:8f19:c4ed with SMTP id
	q20-20020a056a000854b029025c8f19c4edmr12994440pfk.40.1618891446229;
	Mon, 19 Apr 2021 21:04:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxeN6i8axKxMd84pMP+ducMBx2KfZ2UxKwDwqWe1JOZmcAbDujiVzhQ8YcYvA9lOoLH8s2cA==
X-Received: by 2002:a05:6a00:854:b029:25c:8f19:c4ed with SMTP id
	q20-20020a056a000854b029025c8f19c4edmr12994428pfk.40.1618891445969;
	Mon, 19 Apr 2021 21:04:05 -0700 (PDT)
Received: from LAP000568.mistral.in ([2401:4900:3307:5453:4cbb:3396:1200:4622])
	by smtp.gmail.com with ESMTPSA id
	r6sm13742442pgp.64.2021.04.19.21.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Apr 2021 21:04:05 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Apr 2021 09:33:58 +0530
Message-Id: <20210420040358.123524-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618891447-302273-19544-14967-1
X-BESS-VER: 2019.1_20210419.1831
X-BESS-Apparent-Source-IP: 209.85.214.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.231677 [from 
	cloudscan20-128.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-Mailman-Approved-At: Tue, 20 Apr 2021 13:17:49 +0000
Subject: [dunfell/master PATCH 0/1] *** AM64x-unification-WIC-files-creation ***
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
X-List-Received-Date: Tue, 20 Apr 2021 04:03:43 -0000
Content-Transfer-Encoding: 8bit

With respective to generating two WIC files under one MACHINE_NAME, two
recpies has to be created. Invoking of this recipes should be called
from the top level bundle recipes which is responsible for creating the
images.

These two recipes responsible for mentioning where the boot images are
deployed.

Sinthu Raja (1):
  AM64x Unification Add recipes to generate WIC file

 .../images/tisdk-base-image-evm.bb            | 19 +++++++++++++++++
 .../images/tisdk-base-image-sk.bb             | 21 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-base-image-evm.bb
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-base-image-sk.bb

-- 
2.17.0


