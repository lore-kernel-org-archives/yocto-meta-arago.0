Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8764E5298B
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 19:38:34 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BJacdV049244
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2020 13:36:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581449798;
	bh=JsExpnIOkrxEkzfFE6WfEssjllWavLduKXpc91+XCu0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fwbE5LTXbNKRy9BSH5VamyLLcc8HGUF3L/+PpHPmTpPf3sW1LCbEEXwK84hIN2NIC
	GaO0Bwd8ZB7PZqLU1/uO8D8uAhe0uEuw5e8Qhaz1hFj0FMt/qXOgimq9tyGbxjF7N6
	oy90TuFE6wVM+fIqShb3ht5PVqXSJ7/W8jxdmRoU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BJacFf094110
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2020 13:36:38 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 11 Feb 2020 13:36:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 11 Feb 2020 13:36:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BJact4103414;
	Tue, 11 Feb 2020 13:36:38 -0600
Date: Tue, 11 Feb 2020 14:36:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Angela Stegmaier <a0866189@ti.com>
Message-ID: <20200211193637.GH20281@beryl>
References: <1581351918-32354-1-git-send-email-angelabaker@ti.com>
	<20200211043348.GA20281@beryl>
	<36253987-2d6b-ac50-199d-343cd9db96af@ti.com>
MIME-Version: 1.0
In-Reply-To: <36253987-2d6b-ac50-199d-343cd9db96af@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master][PATCH] packagegroup-arago-tisdk-addons: replacing ipc-lld-fw
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
X-List-Received-Date: Tue, 11 Feb 2020 19:38:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 11, 2020 at 01:34:45PM -0600, Angela Stegmaier wrote:
> 
> 
> On 2/10/20 10:33 PM, Denys Dmytriyenko wrote:
> >Have you tried building it?
> >
> 
> I did, but... looks like my setup had older pdk-fetch recipe in meta-ti.
> After updating all to latest I am seeing a build failure in board-rtos.

I also saw failures in pm-lld-rtos on am65.


> Thanks,
> Angela
> 
> >
> >On Mon, Feb 10, 2020 at 10:25:18AM -0600, Angela Stegmaier wrote:
> >>From: Santosh Jha <sjha@ti.com>
> >>
> >>Replacing ipc-lld-fw with ipc-lld-examples-rtos to
> >>build from source.
> >>
> >>Signed-off-by: Santosh Jha <sjha@ti.com>
> >>Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> >>---
> >>  .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >>index a1b55ee..1612322 100644
> >>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >>@@ -77,8 +77,8 @@ UTILS_append_k3 = " mmc-utils \
> >>                      jailhouse \
> >>  "
> >>-UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss pru-pwm-fw"
> >>-UTILS_append_j7-evm = " ipc-lld-fw pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
> >>+UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
> >>+UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
> >>  UTILS_append_omapl138 = " ti-ipc-rtos-fw"
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

