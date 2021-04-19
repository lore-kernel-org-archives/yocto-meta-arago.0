Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 81FBF52AB6
	for <meta-arago@arago-project.org>;
	Mon, 19 Apr 2021 11:47:15 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
	[209.85.216.70]) by
	mx-outbound8-225.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 19 Apr 2021 11:47:40 +0000
Received: by mail-pj1-f70.google.com with SMTP id
	c6-20020a17090aa606b029014e6b52299aso14486169pjq.1
	for <meta-arago@arago-project.org>;
	Mon, 19 Apr 2021 04:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qtIrjN7Gg9uyo1GVaNzrmeU6ctRh4GywwfklB5OFcJY=;
	b=droTZ0uR8XOUflbrKnm4QdbEGAZhM1s23N0Cwh7WJRapxnUHilxr73cTmzCzw5v99m
	PhpgJx4dms4QOmRLmziTcg9+HlH0/5eJHL1D3KpZpvkJwhTcrQKzn3HDwmS0isRnOf9u
	gUyNJ9b4q4NeFbDtzSU8QVWh7hYrqSBLC6gvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qtIrjN7Gg9uyo1GVaNzrmeU6ctRh4GywwfklB5OFcJY=;
	b=j6rfpyFyHjTvh1n6Cdx0TwzOgMwGJ6GQnCTS51N2cwPNgqGUq/HoOwLTezLUoITrI1
	KXf236DPD/Vz9DNE33bb7bKbiFqV71/gSMJhiiV+N5EEwTVVpSg8quEgc1TO0AhAYpoz
	NxY5toai9ffvII7VxIPD1Ki/ZvTxeFPdjM03JQ7Fb/h/ZbVCWJXDivX7mR5SwtUQDlpO
	UfdBvIIDclU3ynND3Wr5PNt+3wpwhAYshZjKc+cw0++eMCIjpfmBNUp8pnm2PpRESWHq
	+i9sLDdg5UQ4qITI48HxsVjIgr0ulys1DgEV1Clcnunv/hDyYoRX9aXr6+BiOuitQVk9
	4I9Q==
X-Gm-Message-State: AOAM5311R7aSY3lWfW+LxZR4+vhBOyPq8XDdsf1IoNS1OYT8h9zGi2L7
	/NwFnCUgPsnpnFG0NPaAbMlJH0USYvCilFBr782YNkjgOGr2nVDhVtboYAmVHnCZn9UZrip+Dww
	f2gOB0bZCoYeGT9vM7ceBZxiiLIow5Aou4JGha1QZ8LSWhpjcEFRG2HkdEflK
X-Received: by 2002:a17:902:7886:b029:e7:1052:adad with SMTP id
	q6-20020a1709027886b02900e71052adadmr22529736pll.75.1618832858654;
	Mon, 19 Apr 2021 04:47:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6kNlhSvNv/z4i5T1iW3rcQKwgk2BJLb73mt8NTEJbCjfkAGzYyq+W2N0+H5vNXKuANRqX1A==
X-Received: by 2002:a17:902:7886:b029:e7:1052:adad with SMTP id
	q6-20020a1709027886b02900e71052adadmr22529719pll.75.1618832858422;
	Mon, 19 Apr 2021 04:47:38 -0700 (PDT)
Received: from LAP000568.mistral.in ([223.227.14.13])
	by smtp.gmail.com with ESMTPSA id
	c129sm12525812pfb.141.2021.04.19.04.47.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Apr 2021 04:47:37 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <x0257345@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 19 Apr 2021 17:17:30 +0530
Message-Id: <20210419114730.102688-1-x0257345@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1618832859-302273-5589-127925-1
X-BESS-VER: 2019.1_20210414.2120
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.231661 [from 
	cloudscan14-170.eu-central-1a.ess.aws.cudaops.com]
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
X-List-Received-Date: Mon, 19 Apr 2021 11:47:16 -0000
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


