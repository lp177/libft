/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strtrim.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: luperez <luperez@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/15 21:35:20 by luperez           #+#    #+#             */
/*   Updated: 2014/11/18 22:35:37 by luperez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strtrim(char const *s)
{
	int		f;
	int		e;
	char	*s2;

	if (s == NULL)
		return (NULL);
	f = -1;
	while ((s[++f] >= 9 && s[f] <= 13) || s[f] == 32)
		;
	e = ft_strlen(&s[f]) + f;
	if (e > f)
		while ((s[--e] >= 9 && s[e] <= 13) || s[e] == 32)
			;
	s2 = (char *)malloc(sizeof(char) * (e - f) + 2);
	ft_bzero(s2, e - f + 2);
	return (ft_strncpy(s2, &s[f], e - f + 1));
}
