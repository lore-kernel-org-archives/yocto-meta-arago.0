Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C22A452987
	for <meta-arago@arago-project.org>;
	Tue, 26 Jun 2018 19:03:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5QJ3nk7056868
	for <meta-arago@arago-project.org>; Tue, 26 Jun 2018 14:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530039829;
	bh=bsmoIK+E6xA49dzKClVw3JcuYZONMHVg3FxyiSQpPfg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pVJ9EYlhL/SqlmFsdXjgez9Xe1OjRIp+2fcFYCjeJAcMpLjXD2pWZg+9KseFf/d8r
	SA66oMC24D1iUJ0qC8eHJZo4dTrlMankNMKNefvi0IUThsBBFyvwa158wCk9TftEvA
	INV6xO1s3TKP6Os9lOJ9UIKm6w5yK1QfTgVZ4eDs=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5QJ3nDp006229
	for <meta-arago@arago-project.org>; Tue, 26 Jun 2018 14:03:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 26 Jun 2018 14:03:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 26 Jun 2018 14:03:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5QJ3nGc015850;
	Tue, 26 Jun 2018 14:03:49 -0500
Date: Tue, 26 Jun 2018 15:02:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ramprasad N <x0038811@ti.com>
Message-ID: <20180626190251.GK3163@beryl>
References: <1529666884-6396-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
In-Reply-To: <1529666884-6396-1-git-send-email-x0038811@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko 0/1] gstwaylandsink
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
X-List-Received-Date: Tue, 26 Jun 2018 19:03:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 22, 2018 at 04:58:03PM +0530, Ramprasad N wrote:
> Add input device like mouse, touch etc to waylandsink.
> 
> Ramprasad N (1):
>   gstreamer1.0*-bad: Input device support in waylandsink
> 
>  ...ylandsink-Add-mouse-drag-and-drop-support.patch | 426 +++++++++
>  ...0005-waylandsink-Add-input-device-support.patch | 990 +++++++++++++++++++++
>  .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   5 +-
>  3 files changed, 1420 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch
>  create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch

What is the upstream status of these patches?

-- 
Denys

