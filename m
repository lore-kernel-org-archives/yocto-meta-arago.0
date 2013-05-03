Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B303252A71
	for <meta-arago@arago-project.org>;
	Fri,  3 May 2013 16:48:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r43GmgGD023310
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 11:48:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r43GmfxS019584
	for <meta-arago@arago-project.org>; Fri, 3 May 2013 11:48:42 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 3 May 2013 11:48:41 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r43GmfYK031982;
	Fri, 3 May 2013 11:48:41 -0500
Date: Fri, 3 May 2013 12:48:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>
Message-ID: <20130503164840.GG9213@edge>
References: <1367519782-30902-1-git-send-email-zhoujt@ti.com>
	<7D46E86EC0A8354091174257B2FED1015952FED9@DLEE11.ent.ti.com>
	<3C08AEEB3C731745938BC83D029FE5E3944B9A@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E3944B9A@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] added mounting debugfs recipe
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
X-List-Received-Date: Fri, 03 May 2013 16:48:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 02, 2013 at 09:33:55PM +0000, Zhou, Jingting wrote:
> Don't want to create another email thread using git send-email. So I just 
> copy-pasted the subsequent patch here. I can resend it using git send-email 
> if you want.

Actually, you don't do subsequent patches fixing comments in the original 
patch - i.e. no patch on top of a patch. Please update the original patch with 
the fixes and re-send it again. Make sure you mark it as [PATCHv2] or v3 etc. 
and also put a log of changes against the previous submission after --- line.
Here's an example of version 3 of a patch:
http://arago-project.org/pipermail/meta-arago/2013-April/001265.html


> Had a quick look at update-rc.d.bbclass. But I didn't figure out how to use 
> it.

initscript-telnet in meta-arago-distro/recipe-connectivity is a good example.

-- 
Denys

