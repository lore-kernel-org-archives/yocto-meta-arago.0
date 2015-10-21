Return-Path: <paul.barker.commagility@gmail.com>
Received: from mail-wi0-f193.google.com (mail-wi0-f193.google.com
	[209.85.212.193])
	by arago-project.org (Postfix) with ESMTPS id 8026252961
	for <meta-arago@arago-project.org>;
	Wed, 21 Oct 2015 12:50:46 +0000 (UTC)
Received: by wiut4 with SMTP id t4so12156520wiu.0
	for <meta-arago@arago-project.org>;
	Wed, 21 Oct 2015 05:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:subject:message-id:organization:mime-version
	:content-type:content-transfer-encoding;
	bh=q91FpFdNXDfq0oJfhwrB/k/yZVAEZ0E4fgq8GZkToJ8=;
	b=cerY45lCLEM6B4Mx7lq8686J/h0IQDdL+Z7iPulD7OiXX/+0dBu4CtJ+Mqliq+1vxb
	yt/0bOSCeV2wUBdPWwdoNmQdSEWKXKRV8Q6evmBWlQgfNytJ0HvCz7kIuSDsh7wp3waa
	oYg5uCSXNCj0/DqWgSbFzErz5Y/Wz9tz3coEDc+k+pL7eYvztVLRbSt1TqYnSSU3aAp+
	NLLUzDgHmA0xz/Wcp2uqd6NmqqVc2hMQp0t7EWXh6sCNxy3krR4pbrwOonRm21zhxfMa
	Osvb1ypj8R8c2m6BdoOBc1y0bwKFJl8P7yYuSre9ckNLJUsrpZJ71WewMMo7TQ8cJoSe
	pxRg==
X-Received: by 10.180.206.230 with SMTP id lr6mr11424891wic.69.1445431845033; 
	Wed, 21 Oct 2015 05:50:45 -0700 (PDT)
Received: from centos-7 (inno-commagility-ownrouter.lut.ac.uk. [131.231.60.35])
	by smtp.gmail.com with ESMTPSA id
	he3sm10235123wjc.48.2015.10.21.05.50.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 05:50:44 -0700 (PDT)
Date: Wed, 21 Oct 2015 13:50:37 +0100
From: Paul Barker <paul.barker@commagility.com>
To: Denys Dmytriyenko <denys@ti.com>, meta-arago@arago-project.org
Message-ID: <20151021135037.200001e5@centos-7>
Organization: CommAgility Ltd
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: meta-arago Fido branch
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
X-List-Received-Date: Wed, 21 Oct 2015 12:50:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

There isn't currently a 'fido' branch in the meta-arago repository. I'm now
following 'fido' on all other layers, on meta-arago it's unclear whether I
should take the commits after the ti2015.01 tag or not.

Would it be possible to add a 'fido' branch?

Thanks,

-- 
Paul Barker
CommAgility Ltd

