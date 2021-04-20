Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id 6C19C52B59
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 17:39:02 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
	[209.85.215.200]) by
	mx-outbound46-177.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 20 Apr 2021 17:39:27 +0000
Received: by mail-pg1-f200.google.com with SMTP id
	c19-20020a631c530000b0290209a37c0a62so2539597pgm.16
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 10:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qtIrjN7Gg9uyo1GVaNzrmeU6ctRh4GywwfklB5OFcJY=;
	b=SXeS3H1VXM55uBGSze8btS+G9p0wwNUFB0yNAI0kAN2UmTApfk6nIUrs09izVS/ioZ
	pyhpfoGtex4jdRQGAvh55iK2wn6+b3b+3VhgdDEQkc6r0qYMJZlxYhMBESG8YNYChZ0b
	vliRy+aump3dbrTV35PoachPu5UMihXqG6++Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qtIrjN7Gg9uyo1GVaNzrmeU6ctRh4GywwfklB5OFcJY=;
	b=sk0/9hPLbGiXSDZCXy1XQ6iJXHTS4kIMJFKsRV9sFkZkhg5UorXhBi3T4jnfYPBpqH
	GoMluX4PoSZIIBtsq06Aaa0Gd2dMvsg6U8x1BS7BhnOm8T8TW6bq3Ez6sOAxk4joSlov
	aTVzd+gAHbXxYfikgrKGri9asNX7rhpirQeJtrZKYB27zwKsW9oLeGNf3D9tBfn8Ityq
	SAxh96hThRPnVoJUFmM4DJIiFa19JvMxU0tn/RV2qRYspW+gTcu9tTwihjGqLv7MxCQv
	FEMf6XDBDVyzOjrcCx8oMykFNERKMkfIX6c6Ni4ezkj6TaCDWwJLhozM+GgBo2/LU+zv
	8klA==
X-Gm-Message-State: AOAM530IPSFA/rGLwqxbB6jTyHgltIMaO9aTV1ir7wyurd/pssKsEyg+
	yMsszOHSXvL+F047vZvUChKIop91DPUaOUGPlGRZ2yez0IyNh+xSpyDypCIrR72fIerEJOQnK1L
	g+LCSgl44x0A9OrPhK0HbHuiOkzR/sYtYHZTa/K4HFp3tp4qY1NhasrRQVsSA
X-Received: by 2002:a62:1401:0:b029:25a:d41c:fb2e with SMTP id
	1-20020a6214010000b029025ad41cfb2emr19484130pfu.51.1618940365875;
	Tue, 20 Apr 2021 10:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoWOSSHDOexy8ZPK4AMaXrncaw/EP/UwkxuDhkWuyhjT4XrzzHNaBsprg2yD1XHxfMxZy65g==
X-Received: by 2002:a62:1401:0:b029:25a:d41c:fb2e with SMTP id
	1-20020a6214010000b029025ad41cfb2emr19484118pfu.51.1618940365693;
	Tue, 20 Apr 2021 10:39:25 -0700 (PDT)
Received: from LAP000568.mistral.in ([49.207.198.212])
	by smtp.gmail.com with ESMTPSA id
	m206sm7253974pfd.87.2021.04.20.10.39.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Apr 2021 10:39:25 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 20 Apr 2021 23:09:16 +0530
Message-Id: <20210420173916.59224-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618940366-311953-3134-1458-1
X-BESS-VER: 2019.1_20210420.1639
X-BESS-Apparent-Source-IP: 209.85.215.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.231689 [from 
	cloudscan19-219.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Subject: [dunfell/master PATCH 0/1] AM64x EVM and SK unification WIC files creation
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
X-List-Received-Date: Tue, 20 Apr 2021 17:39:02 -0000
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


