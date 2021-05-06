Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id A64EA52CF9
	for <meta-arago@arago-project.org>;
	Thu,  6 May 2021 17:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 83F5040C86;
	Thu,  6 May 2021 17:29:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id tUpPsCnqw6uS; Thu,  6 May 2021 17:29:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6306140C85;
	Thu,  6 May 2021 17:29:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C900D1745E4; Thu,  6 May 2021 13:29:10 -0400 (EDT)
Date: Thu, 6 May 2021 13:29:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20210506172909.GR21867@denix.org>
References: <20210506025812.25256-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210506025812.25256-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master][PATCH 0/6] Install qt based demos on machine feature check
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
X-List-Received-Date: Thu, 06 May 2021 17:28:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The series looks good to me.

On Wed, May 05, 2021 at 09:58:06PM -0500, Gowtham Tammana wrote:
> The following demo packages are qt based and have a dependency on it, so they
> have to be installed conditionally on the machine feature gpu presence. This
> series add those changes to ensure dependencies are populated correctly for
> different sdk images.
> 
>   - pdm-anomaly-detection
>   - matrix-analytics-pdm-anomaly-detection
>   - dual-camera-demo
>   - matrix-gui-apps-dual-camera
>   - image-gallery
>   - matrix-gui-apps-image-gallery
>   - evse-hmi
>   - matrix-hmi-demo-evse
>   - matrix-hmi-demo-mmwavegesture
>   - matrix-hmi-demo-protection-relays
> 
> Gowtham Tammana (6):
>   ti-demos: Add feature check for pdm demos
>   packagegroup-arago-tisdk*: add feature check for pdm-anomaly-detection
>   packagegroup-arago-tisdk*: Add feature depenendency for
>     dual-camera-demo
>   packagegroups-arago-tisdk*: image-gallery: Add machine feature
>     conditional
>   tisdk-core-bundle: Conditionally install the hmi demos
>   packagegroup-arago-tisdk-hmi*: Install them conditionally
> 
>  .../recipes-core/images/tisdk-core-bundle.inc |  2 +-
>  ...ackagegroup-arago-tisdk-addons-sdk-host.bb | 12 +++--
>  ...kagegroup-arago-tisdk-addons-sdk-target.bb | 13 +++--
>  .../packagegroup-arago-tisdk-hmi-sdk-host.bb  |  4 +-
>  .../packagegroup-arago-tisdk-hmi.bb           |  4 +-
>  .../packagegroup-arago-tisdk-matrix.bb        | 51 +++++++++++--------
>  ...gegroup-arago-tisdk-multimedia-sdk-host.bb | 11 ++--
>  .../packagegroup-arago-tisdk-multimedia.bb    | 11 ++--
>  .../recipes-core/packagegroups/ti-demos.bb    | 10 ++--
>  9 files changed, 73 insertions(+), 45 deletions(-)
> 
> -- 
> 2.31.1

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

