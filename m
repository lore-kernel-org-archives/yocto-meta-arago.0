Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 96F7452A81
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2014 17:07:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0TH7CrQ018636;
	Wed, 29 Jan 2014 11:07:12 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TH7CxV019556;
	Wed, 29 Jan 2014 11:07:12 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 Jan 2014 11:07:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TH7Cg4024644;
	Wed, 29 Jan 2014 11:07:12 -0600
Date: Wed, 29 Jan 2014 12:07:12 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Samant Kumar <samant.uvaca@gmail.com>
Message-ID: <20140129170711.GQ6814@edge>
References: <CA+B-G-jDW=-RBE7ZWUMS7fLiHOdMc0uquHRZS+yF=+uRX0qMMQ@mail.gmail.com>
	<CA+B-G-hPSwxU-TkOQyxXw=Hd=7G8kS+cW5VGxGxLca0Rn4j8iw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+B-G-hPSwxU-TkOQyxXw=Hd=7G8kS+cW5VGxGxLca0Rn4j8iw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: DM816x-evm
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
X-List-Received-Date: Wed, 29 Jan 2014 17:07:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jan 29, 2014 at 08:35:54AM -0800, Samant Kumar wrote:
> Hi Denys,
> I couldn't find any MACHINE conf for dm816x-evm or c6a816x-evm? Is there
> special tree/branch for support for Netra? I want to use arago software
> infrastructure for Netra s/w development.

Samant,

Unfortunately, support for TI81x platforms was removed from meta-ti some time 
ago:

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1544/focus=1545

There were numerous discussions on this topic on meta-ti mailing list - you 
might want to take a look...

-- 
Denys

