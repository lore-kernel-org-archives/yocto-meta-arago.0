Return-Path: <paul.barker@konsulko.com>
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
	[209.85.161.43])
	by arago-project.org (Postfix) with ESMTPS id DBC7552A3C
	for <meta-arago@arago-project.org>;
	Wed, 29 Apr 2020 08:35:53 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id q204so251713ooq.1
	for <meta-arago@arago-project.org>;
	Wed, 29 Apr 2020 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=xzbOELf1VBzV90PAeAYqKMeVgA9yaXFX02cCLkbKH5w=;
	b=Q5v2U8B9JFCD+8H6moLB6P1thV8YVI2NOivJn283DyxcqlMGF2EbTtLMZTz29ChvEi
	fsnKSTT+fPOSGs2qMfDTnBft0xg3XBlaxg78nW/UwW6sQJERl6NUWPRDuRGIRXmUWQD8
	HEMDKAoIObOGFCO4hGzU0w/BA6LzqfuXvPsjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=xzbOELf1VBzV90PAeAYqKMeVgA9yaXFX02cCLkbKH5w=;
	b=jNEsJgYh+mm7+6hSFmu+IRNVu74Aq4j05mQHrpRjIgiUxd3BJkM494NgIANmmQXSik
	azVNTOQA+cBaYrROVgJMVFwt2e0PQKtm0zx9GsHVspVAFyVQtZxxHnWUT6hdxBHcTHgw
	XlKEfpJgVIMa5yfTjd+aeIt4uiqybOYw1KkpuxP1qHSUFnjA7VjgbPogfpmBgTm1PQDd
	9GO8gd774D02D43DjMEX6MVej9iYFTGCBNRduFk3KR0qXevjfGXXmxPqOq3RBbavHVtA
	aJHVwLQq/QSktHkBMRbeaygFcjJCq0Zl7AmLgME+wFVG/kM690qeeuh0cAIUyeWYFvcr
	blXw==
X-Gm-Message-State: AGi0PuZtdQRJIRtGE3Y0OV8PTFYPpeZMKqATX/7uX/45PslfwR/gw/7C
	garvyv+hC8+QVVuRQcFDSWFam42W+Rqkin4rF8OkaQ==
X-Google-Smtp-Source: APiQypLxNt/a3hgXrgSBYLNc+dEL1BXumK8jMM/po/PpbHBieD+zjTf9aCNYggC8NyWSvrpeWLET+TWVxkmfO/wy9J4=
X-Received: by 2002:a4a:df01:: with SMTP id i1mr26769111oou.5.1588149212865;
	Wed, 29 Apr 2020 01:33:32 -0700 (PDT)
MIME-Version: 1.0
From: Paul Barker <pbarker@konsulko.com>
Date: Wed, 29 Apr 2020 09:33:22 +0100
Message-ID: <CAM9ZRVvLaQTzUH29DauqEgSuw21iRrKneGqB8i0SXy3OvW-08g@mail.gmail.com>
To: meta-ti@lists.yoctoproject.org, meta-arago@arago-project.org
Subject: Arago & meta-ti support for Yocto Project LTS release
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
X-List-Received-Date: Wed, 29 Apr 2020 08:35:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hi folks,

Is there a plan to support the new Yocto Project LTS release (dunfell)
for Arago distro and meta-ti? I know usually every other Yocto Project
release is supported, zeus was supported so usually dunfell wouldn't
be.

If so, are you planning to support this for the full LTS period of 2 years?

I imagine this will be supported but would be good to get confirmation.

Thanks,
Paul

