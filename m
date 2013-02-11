Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 71AB152A2C
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 20:04:25 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1BK4O8K001518
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 14:04:24 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1BK4OUP021735
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 14:04:24 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 11 Feb 2013 14:04:25 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1BK4ORY021133;
	Mon, 11 Feb 2013 14:04:24 -0600
Date: Mon, 11 Feb 2013 15:04:23 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>
Message-ID: <20130211200423.GA11440@edge>
References: <3C08AEEB3C731745938BC83D029FE5E3917A18@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E3917A18@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: lldpd recipe
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
X-List-Received-Date: Mon, 11 Feb 2013 20:04:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 06, 2013 at 09:15:17PM +0000, Zhou, Jingting wrote:
> Hey all, attached is the recipe for lldpd. Please take a look. Thanks~

1. You still haven't subscribed to the mailing list - until you subscribe, you 
won't be able to easily post to the list and I would have to go and approve 
your every email.

2. Please do not attach patches to the public mailing lists - please rather 
inline them. That way it's easier to review and comment on the patch. The 
easiest is to use git-send-email directly...

3. It's also important that you follow at least basics of the commit message 
guideline: http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

PS. All these nuances I was meaning to teach you and others from your team as 
part of the training I started, specifically the development work flow...

-- 
Denys

