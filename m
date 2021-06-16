Return-Path: <nikhil.nd@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 8E42452B53
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 13:19:46 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15GDKV7U054985;
	Wed, 16 Jun 2021 08:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623849631;
	bh=qckX10SspztSsI30+LJu23gkeAHi9OIFt3pVTudtuis=;
	h=From:To:CC:Subject:Date;
	b=ts4zdBH3KAVKfvneP+Zp77tH4XeeXfLLBVzzFo2Zp8ueQA1njCqZRk0irIhGmFupV
	9jk/3bIDB8s3fync6iY1qmy67HCVGU0eun+ky1dVEIdwRKXe+htKKYPdVkTAc6rl6S
	e/8H3i531g4FJt42B201avwlxbnQ/kywNG7bmr8c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15GDKV12079305
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Jun 2021 08:20:31 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 16 Jun 2021 08:20:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 16 Jun 2021 08:20:30 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15GDKSnp015027; 
	Wed, 16 Jun 2021 08:20:29 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
Date: Wed, 16 Jun 2021 18:50:22 +0530
Message-ID: <20210616132024.29566-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell/master 0/2] Remove Jailhouse support
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
X-List-Received-Date: Wed, 16 Jun 2021 13:19:47 -0000
Content-Type: text/plain

This series removes the Jailhouse and corresponding recipes from
meta-arago

Nikhil Devshatwar (2):
  recipes-tisdk: tisdk-makefile: Remove Jailhouse snippet
  conf: arago: Remove jailhouse references

 meta-arago-distro/conf/distro/arago.conf      |  3 --
 .../conf/distro/include/arago-source-ipk.inc  |  7 ---
 .../ti-tisdk-makefile/Makefile_jailhouse      | 44 -------------------
 3 files changed, 54 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_jailhouse

-- 
2.17.1


