Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 2D7DB52A89
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2013 14:20:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB6EKcMp013656
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2013 08:20:38 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB6EKcDt012576
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2013 08:20:38 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 6 Dec 2013 08:20:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB6EKbFm018326;
	Fri, 6 Dec 2013 08:20:37 -0600
Date: Fri, 6 Dec 2013 09:20:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Rajasekar <x0211375@ti.com>
Message-ID: <20131206142036.GA690@edge>
References: <1386323741-18669-1-git-send-email-x0211375@ti.com>
MIME-Version: 1.0
In-Reply-To: <1386323741-18669-1-git-send-email-x0211375@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 0/2] machine config for am438x EPOS and am437x HS evm
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
X-List-Received-Date: Fri, 06 Dec 2013 14:20:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Dec 06, 2013 at 03:25:41PM +0530, Rajasekar wrote:
> Deepak M (1):
>   am43xx: Added machine config for am437x HS evm
> 
> Rajasekar (1):
>   am438x : Added machine config for am438x EPOS machine
> 
>  conf/machine/am437x-hs-evm.conf   |   39 +++++++++++++++++++++++++++++++++++++
>  conf/machine/am438x-epos-evm.conf |   36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 conf/machine/am437x-hs-evm.conf
>  create mode 100644 conf/machine/am438x-epos-evm.conf

It's a wrong list for these patches. Should be meta-ti@yoctoproject.org, but 
otherwise the patches are fine, as long as there's somthing else that uses 
those machines configurations...

-- 
Denys

