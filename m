Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6C6F052A2C
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 20:08:06 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1BK868A003876
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 14:08:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1BK86fg025762
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 14:08:06 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 11 Feb 2013 14:08:05 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1BK852E021963;
	Mon, 11 Feb 2013 14:08:05 -0600
Date: Mon, 11 Feb 2013 15:08:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>
Message-ID: <20130211200804.GB11440@edge>
References: <3C08AEEB3C731745938BC83D029FE5E3917A77@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E3917A77@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: new image recipe
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
X-List-Received-Date: Mon, 11 Feb 2013 20:08:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 06, 2013 at 09:18:15PM +0000, Zhou, Jingting wrote:
> Hey all, attached is the recipe for a new image 
> arago-headless-tisdk-keystone2-image. Please take a look. Thanks~

All the comments I made to your previous patch are still applicable here, 
plus:

1. Don't make tasks or images specific to a machine/SoC like that. First of 
all, you can avoid making it completely machine-specific and second, you may 
need to use overrides in the recipe itself for really specific things.

2. Please make sure the whitespaces are consistent.

-- 
Denys

